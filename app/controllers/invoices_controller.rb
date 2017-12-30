class InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      invoices = []
      Invoice.all.each do |invoice|
        construct_invoice = {
          id: invoice.id,
          number: invoice.number,
          vendor: Vendor.find(invoice.vendor_id),
          date: invoice.date,
          items: Item.where(invoice_id: invoice.id),
          total: invoice.total,
          createdAt: invoice.created_at,
          updatedAt: invoice.updated_at
        }
        invoices.push(construct_invoice)
      end

      render :status => :ok, :json => {
        invoices: invoices
      }
    end

    def show
      invoice = Invoice.find(params[:id])
      construct_invoice = {
        id: invoice.id,
        number: invoice.number,
        vendor: Vendor.find(invoice.vendor_id),
        date: invoice.date,
        items: Item.where(invoice_id: invoice.id),
        total: invoice.total,
        createdAt: invoice.created_at,
        updatedAt: invoice.updated_at
      }

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
