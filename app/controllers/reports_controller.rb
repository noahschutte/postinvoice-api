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

    category = Category.find_by(id: params[:category], deleted_at: nil)
    category_total_sales = params[:categoryTotalSales]

    start_inventory_sheet = InventorySheet.find_by(id: params[:startInventorySheet], deleted_at: nil)
    end_inventory_sheet = InventorySheet.find_by(id: params[:endInventorySheet], deleted_at: nil)

    start_invoice_date_range = DateTime.parse(params[:startInvoiceDateRange])
    end_invoice_date_range = DateTime.parse(params[:endInvoiceDateRange])

    if category.name == 'Beer'
      prior_inventory_amount = start_inventory_sheet.beer_total
      ending_inventory_amount = end_inventory_sheet.beer_total
    elsif category.name == 'Wine'
      prior_inventory_amount = start_inventory_sheet.wine_total
      ending_inventory_amount = end_inventory_sheet.wine_total
    elsif category.name == 'Food'
      prior_inventory_amount = start_inventory_sheet.food_total
      ending_inventory_amount = end_inventory_sheet.food_total
    end

    invoices = Invoice.where(date: start_invoice_date_range..end_invoice_date_range, deleted_at: nil)
    invoice_ids = []
    invoices.each do |invoice|
      invoice_ids.push(invoice.id)
    end

    items = Item.where(invoice_id: invoice_ids, category_id: category.id, deleted_at: nil)

    category_purchases_amount = 0
    items.each do |item|
      category_purchases_amount += item.amount
    end

    total_inventory_cost = prior_inventory_amount + category_purchases_amount - ending_inventory_amount
    cost_percentage = ActionController::Base.helpers.number_to_percentage(total_inventory_cost / category_total_sales.to_i * 100, precision: 2)

    render :json => {
      cost_percentage: cost_percentage
    }
  end

end
