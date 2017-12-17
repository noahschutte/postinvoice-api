class InvoicesController < ApplicationController

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
      render :json => {
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
      render :json => {
        invoices: construct_invoice
      }
    end

    def create
      invoice = Invoice.create(
        date: params[:date],
        supplier_name: params[:supplierName],
        invoice_number: params[:invoiceNumber],
        total: params[:total]
      )
      items = params[:items]
      p 'items: ', items
      # items.each do |item|
      #   Item.create(
      #     invoice_id: invoice.id,
      #     code: item.code,
      #     amount: item.amount
      #   )
      # end
      render :json => {
        message: 'incomplete create route'
      }
    end

    def update
      render :json => {
        message: 'incomplete update route'
      }
    end

    def destroy
      Item.where(invoice_id: params[:id]).each do |item|
        item.destroy
      end
      Invoice.find(params[:id]).destroy
      render :json => {
        message: 'successful destroy'
      }
    end

end
