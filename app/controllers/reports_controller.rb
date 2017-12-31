class ReportsController < ApplicationController

  def index
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

    beer_total_sales = params[:beerTotalSales]
    wine_total_sales = params[:wineTotalSales]
    food_total_sales = params[:foodTotalSales]

    start_inventory_sheet = InventorySheet.find_by(id: params[:startInventorySheet], deleted_at: nil)
    end_inventory_sheet = InventorySheet.find_by(id: params[:endInventorySheet], deleted_at: nil)

    start_invoice_date_range = DateTime.parse(params[:startInvoiceDateRange])
    end_invoice_date_range = DateTime.parse(params[:endInvoiceDateRange])

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

    if beer_total_sales
      beer_inventory_cost = beer_prior_inventory_amount + beer_purchases_amount - beer_ending_inventory_amount
      beer_cost_percentage = ActionController::Base.helpers.number_to_percentage(beer_inventory_cost / beer_total_sales.to_i * 100, precision: 2)
    end

    if wine_total_sales
      wine_inventory_cost = wine_prior_inventory_amount + wine_purchases_amount - wine_ending_inventory_amount
      wine_cost_percentage = ActionController::Base.helpers.number_to_percentage(wine_inventory_cost / wine_total_sales.to_i * 100, precision: 2)
    end

    if food_total_sales
      food_inventory_cost = food_prior_inventory_amount + food_purchases_amount - food_ending_inventory_amount
      food_cost_percentage = ActionController::Base.helpers.number_to_percentage(food_inventory_cost / food_total_sales.to_i * 100, precision: 2)
    end
    
    render :json => {
      beerCostPercentage: beer_cost_percentage,
      wineCostPercentage: wine_cost_percentage,
      foodCostPercentage: food_cost_percentage
    }
  end

end
