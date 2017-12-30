class ReportsController < ApplicationController

  def index
    CSV.open("report.csv", "w") do |csv|
      headers = [
        'Date',
        'Supplier Name',
        'Invoice Number',
        'Code',
        'Amount',
      ]
      csv << headers

      Item.where(deleted_at: nil).each do |item|
        invoice = Invoice.find(item.invoice_id)
        row = [
          invoice.date,
          invoice.supplier_name,
          invoice.invoice_number,
          item.code,
          item.amount
        ]
        csv << row
      end
      render :json => {
        message: 'incomplete reports index route'
      }
    end
  end

end
