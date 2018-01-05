class ReportsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    reports = Report.where(deleted_at: nil)

    render :status => :ok, :json => {
      reports: reports
    }
  end

  def show
    report = Report.find_by(id: params[:id], deleted_at: nil)

    beer_sales_total = report.beer_sales_total
    wine_sales_total = report.wine_sales_total
    food_sales_total = report.food_sales_total

    start_inventory_sheet = InventorySheet.find_by(id: report.start_inventory_sheet_id, deleted_at: nil)
    end_inventory_sheet = InventorySheet.find_by(id: report.end_inventory_sheet_id, deleted_at: nil)

    start_invoice_date_range = report.start_date_range
    end_invoice_date_range = report.end_date_range

    beer_prior_inventory_amount = start_inventory_sheet.beer_total
    beer_ending_inventory_amount = end_inventory_sheet.beer_total
    wine_prior_inventory_amount = start_inventory_sheet.wine_total
    wine_ending_inventory_amount = end_inventory_sheet.wine_total
    food_prior_inventory_amount = start_inventory_sheet.food_total
    food_ending_inventory_amount = end_inventory_sheet.food_total

    invoices = Invoice.where(date: start_invoice_date_range..end_invoice_date_range, deleted_at: nil)
    invoice_ids = []
    invoices.each do |invoice|
      invoice_ids.push(invoice.id)
    end

    beer_items = Item.where(invoice_id: invoice_ids, category_id: 1, deleted_at: nil)
    wine_items = Item.where(invoice_id: invoice_ids, category_id: 2, deleted_at: nil)
    food_items = Item.where(invoice_id: invoice_ids, category_id: 3, deleted_at: nil)

    beer_purchases_amount = 0
    beer_items.each do |beer_item|
      beer_purchases_amount += beer_item.amount
    end

    wine_purchases_amount = 0
    wine_items.each do |wine_item|
      wine_purchases_amount += wine_item.amount
    end

    food_purchases_amount = 0
    food_items.each do |food_item|
      food_purchases_amount += food_item.amount
    end

    if beer_sales_total
      beer_inventory_cost = beer_prior_inventory_amount + beer_purchases_amount - beer_ending_inventory_amount
      beer_cost_percentage = ActionController::Base.helpers.number_to_percentage(beer_inventory_cost / beer_sales_total.to_i * 100, precision: 2)
    end

    if wine_sales_total
      wine_inventory_cost = wine_prior_inventory_amount + wine_purchases_amount - wine_ending_inventory_amount
      wine_cost_percentage = ActionController::Base.helpers.number_to_percentage(wine_inventory_cost / wine_sales_total.to_i * 100, precision: 2)
    end

    if food_sales_total
      food_inventory_cost = food_prior_inventory_amount + food_purchases_amount - food_ending_inventory_amount
      food_cost_percentage = ActionController::Base.helpers.number_to_percentage(food_inventory_cost / food_sales_total.to_i * 100, precision: 2)
    end

    construct_report = {
      id: report.id,
      startInvoiceDateRange: start_invoice_date_range,
      endInvoiceDateRange: end_invoice_date_range,
      beerPriorInventoryAmount: beer_prior_inventory_amount,
      beerEndingInventoryAmount: beer_ending_inventory_amount,
      winePriorInventoryAmount: wine_prior_inventory_amount,
      wineEndingInventoryAmount: wine_ending_inventory_amount,
      foodPriorInventoryAmount: food_prior_inventory_amount,
      foodEndingInventoryAmount: food_ending_inventory_amount,
      beerPurchasesAmount: beer_purchases_amount,
      winePurchasesAmount: wine_purchases_amount,
      foodPurchasesAmount: food_purchases_amount,
      beerInventoryCost: beer_inventory_cost,
      wineInventoryCost: wine_inventory_cost,
      foodInventoryCost: food_inventory_cost,

      beerCostPercentage: beer_cost_percentage,
      wineCostPercentage: wine_cost_percentage,
      foodCostPercentage: food_cost_percentage
    }

    render :status => :ok, :json => {
      report: construct_report
    }
  end

  def create
    start_inventory_sheet = InventorySheet.find_by(id: request[:startInventorySheetId], deleted_at: nil)
    end_inventory_sheet = InventorySheet.find_by(id: request[:endInventorySheetId], deleted_at: nil)
    if !start_inventory_sheet || !end_inventory_sheet
      render :status => 400, :json => { errorMessage: "Inventory sheet does not exist." }
    else
      report = Report.create!(
        start_inventory_sheet: start_inventory_sheet,
        end_inventory_sheet: end_inventory_sheet,
        start_date_range: request[:startDateRange],
        end_date_range: request[:endDateRange],
        beer_sales_total: request[:beerSalesTotal],
        wine_sales_total: request[:wineSalesTotal],
        food_sales_total: request[:foodSalesTotal],
      )

      beer_sales_total = report.beer_sales_total
      wine_sales_total = report.wine_sales_total
      food_sales_total = report.food_sales_total

      start_inventory_sheet = InventorySheet.find_by(id: report.start_inventory_sheet_id, deleted_at: nil)
      end_inventory_sheet = InventorySheet.find_by(id: report.end_inventory_sheet_id, deleted_at: nil)

      start_invoice_date_range = report.start_date_range
      end_invoice_date_range = report.end_date_range

      beer_prior_inventory_amount = start_inventory_sheet.beer_total
      beer_ending_inventory_amount = end_inventory_sheet.beer_total
      wine_prior_inventory_amount = start_inventory_sheet.wine_total
      wine_ending_inventory_amount = end_inventory_sheet.wine_total
      food_prior_inventory_amount = start_inventory_sheet.food_total
      food_ending_inventory_amount = end_inventory_sheet.food_total

      invoices = Invoice.where(date: start_invoice_date_range..end_invoice_date_range, deleted_at: nil)
      invoice_ids = []
      invoices.each do |invoice|
        invoice_ids.push(invoice.id)
      end

      beer_items = Item.where(invoice_id: invoice_ids, category_id: 1, deleted_at: nil)
      wine_items = Item.where(invoice_id: invoice_ids, category_id: 2, deleted_at: nil)
      food_items = Item.where(invoice_id: invoice_ids, category_id: 3, deleted_at: nil)

      beer_purchases_amount = 0
      beer_items.each do |beer_item|
        beer_purchases_amount += beer_item.amount
      end

      wine_purchases_amount = 0
      wine_items.each do |wine_item|
        wine_purchases_amount += wine_item.amount
      end

      food_purchases_amount = 0
      food_items.each do |food_item|
        food_purchases_amount += food_item.amount
      end

      if beer_sales_total
        beer_inventory_cost = beer_prior_inventory_amount + beer_purchases_amount - beer_ending_inventory_amount
        beer_cost_percentage = ActionController::Base.helpers.number_to_percentage(beer_inventory_cost / beer_sales_total.to_i * 100, precision: 2)
      end

      if wine_sales_total
        wine_inventory_cost = wine_prior_inventory_amount + wine_purchases_amount - wine_ending_inventory_amount
        wine_cost_percentage = ActionController::Base.helpers.number_to_percentage(wine_inventory_cost / wine_sales_total.to_i * 100, precision: 2)
      end

      if food_sales_total
        food_inventory_cost = food_prior_inventory_amount + food_purchases_amount - food_ending_inventory_amount
        food_cost_percentage = ActionController::Base.helpers.number_to_percentage(food_inventory_cost / food_sales_total.to_i * 100, precision: 2)
      end

      construct_report = {
        id: report.id,
        startInvoiceDateRange: start_invoice_date_range,
        endInvoiceDateRange: end_invoice_date_range,
        beerPriorInventoryAmount: beer_prior_inventory_amount,
        beerEndingInventoryAmount: beer_ending_inventory_amount,
        winePriorInventoryAmount: wine_prior_inventory_amount,
        wineEndingInventoryAmount: wine_ending_inventory_amount,
        foodPriorInventoryAmount: food_prior_inventory_amount,
        foodEndingInventoryAmount: food_ending_inventory_amount,
        beerPurchasesAmount: beer_purchases_amount,
        winePurchasesAmount: wine_purchases_amount,
        foodPurchasesAmount: food_purchases_amount,
        beerInventoryCost: beer_inventory_cost,
        wineInventoryCost: wine_inventory_cost,
        foodInventoryCost: food_inventory_cost,

        beerCostPercentage: beer_cost_percentage,
        wineCostPercentage: wine_cost_percentage,
        foodCostPercentage: food_cost_percentage
      }

      render :status => :ok, :json => {
        report: construct_report
      }
    end
  end

  def destroy
    report = Report.find_by(id: params[:id], deleted_at: nil)
    report.deleted_at = DateTime.now.to_date
    report.save

    render :status => :ok, :json => {
      message: 'Destroyed Report.'
    }
  end

  # def index
    # CSV.open("report.csv", "w") do |csv|
    #   headers = [
    #     'Date',
    #     'Supplier Name',
    #     'Invoice Number',
    #     'Code',
    #     'Amount',
    #   ]
    #   csv << headers
    #
    #   Item.where(deleted_at: nil).each do |item|
    #     invoice = Invoice.find(item.invoice_id)
    #     row = [
    #       invoice.date,
    #       invoice.supplier_name,
    #       invoice.invoice_number,
    #       item.code,
    #       item.amount
    #     ]
    #     csv << row
    #   end
  # end

end
