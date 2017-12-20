class InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      invoices = []
      Invoice.all.each do |invoice|
        construct_invoice = {
          id: invoice.id,
          date: invoice.date,
          supplierName: invoice.supplier_name,
          invoiceNumber: invoice.invoice_number,
          total: ActionController::Base.helpers.number_to_currency(invoice.total, precision: 2)
        }
        items = []
        Item.where(invoice_id: invoice.id).each do |item|
          construct_item = {
            id: item.id,
            code: item.code,
            amount: ActionController::Base.helpers.number_to_currency(item.amount, precision: 2)
          }
          items.push(construct_item)
        end
        construct_invoice['items'] = items

        invoices.push(construct_invoice)
      end
      render :status => :ok, :json => {
        invoices: invoices
      }
    end

    def show
      construct_invoice = {}
      Invoice.where(id: params[:id]).each do |invoice|
        construct_invoice['id'] = invoice.id
        construct_invoice['date'] = invoice.date
        construct_invoice['supplierName'] = invoice.supplier_name
        construct_invoice['invoiceNumber'] = invoice.invoice_number
        construct_invoice['total'] = ActionController::Base.helpers.number_to_currency(invoice.total, precision: 2)
        items = []
        Item.where(invoice_id: invoice.id).each do |item|
          construct_item = {
            id: item.id,
            code: item.code,
            amount: ActionController::Base.helpers.number_to_currency(item.amount, precision: 2)
          }
          items.push(construct_item)
        end
        construct_invoice['items'] = items

      end
      render :status => :ok, :json => {
        invoice: construct_invoice
      }
    end

    def create
      invoice = Invoice.create!(
        date: request[:date],
        supplier_name: request[:supplierName],
        invoice_number: request[:invoiceNumber],
        total: request[:total]
      )
      items = request[:items]
      items.each do |item|
        Item.create!(
          code: item['code'],
          amount: item['amount'],
          invoice_id: invoice.id
        )
      end
      render :status => :ok, :json => {
        message: 'Created Invoice and Items.'
      }
    end

    def destroy
      items = Item.where(invoice_id: params[:id])
      if items
        items.each do |item|
          item.destroy
        end
      end
      invoice = Invoice.find(params[:id])
      invoice.destroy
      render :status => :ok, :json => {
        message: 'Destroyed Invoice and Items.'
      }
    end

end
