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
      if request[:vendor][:isNew] == true
        vendor = Vendor.create!(name: request[:vendor][:name])
        vendor_id = vendor.id
      else
        vendor_id = request[:vendor][:id]
      end

      invoice = Invoice.create!(
        date: request[:date],
        vendor_id: vendor_id,
        number: request[:number],
        total: request[:total]
      )

      if request[:code][:isNew] == true
        code = Code.create!(name: request[:code][:name])
        code_id = code.id
      else
        code_id = request[:code][:id]
      end

      items = request[:items]
      items.each do |item|
        Item.create!(
          invoice_id: invoice.id,
          code_id: code_id,
          amount: item['amount']
        )
      end
      render :status => :ok, :json => {
        message: 'Created Invoice, Items, and Vendor/Codes as needed.'
      }
    end

    def destroy
      invoice_id = params[:id]
      invoice = Invoice.find(invoice_id)
      vendor_id = invoice.vendor_id
      invoices = Invoice.where(vendor_id: vendor_id)

      vendor_invoices = 0
      invoices.each do |invoice|
        if invoice.vendor_id == vendor_id
          vendor_invoices += 1
        end
      end

      if vendor_invoices == 1
        vendor = Vendor.find(vendor_id)
        vendor.destroy!
      end

      code_ids = []
      invoice_items = Item.where(invoice_id: invoice_id)
      invoice_items.each do |invoice_item|
        code_ids.push(invoice_item.code_id)
      end

      code_ids.each do |code_id|
        items = Item.where(code_id: code_id)
        items_from_invoice_item_code = 0

        items.each do |item|
          if item.code_id == code_id
            items_from_invoice_item_code += 1
          end
        end

        if items_from_invoice_item_code == invoice_items.count
          code = Code.find(code_id)
          code.destroy!
        end
      end

      items = Item.where(invoice_id: invoice_id)
      if items
        items.each do |item|
          item.destroy!
        end
      end

      invoice.destroy!

      render :status => :ok, :json => {
        message: 'Destroyed Invoice, Items, and Vendor/Codes as needed.'
      }
    end

end
