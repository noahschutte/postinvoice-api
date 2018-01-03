class InvoicesController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      invoices = []
      Invoice.where(deleted_at: nil).each do |invoice|
        construct_invoice = {
          id: invoice.id,
          number: invoice.number,
          vendor: Vendor.find_by(id: invoice.vendor_id, deleted_at: nil),
          date: invoice.date,
          items: Item.where(invoice_id: invoice.id, deleted_at: nil),
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
      invoice = Invoice.find_by(id: params[:id], deleted_at: nil)
      construct_invoice = {
        id: invoice.id,
        number: invoice.number,
        vendor: Vendor.find_by(id: invoice.vendor_id, deleted_at: nil),
        date: invoice.date,
        items: Item.where(invoice_id: invoice.id, deleted_at: nil),
        total: invoice.total,
        createdAt: invoice.created_at,
        updatedAt: invoice.updated_at
      }

      render :status => :ok, :json => {
        invoice: construct_invoice
      }
    end

    def create
      vendor = request[:vendor]
      if vendor[:isNew]
        vendor = Vendor.create!(name: vendor[:name])
        vendor_id = vendor.id
      else
        vendor_id = vendor[:id]
      end

      invoice = Invoice.create!(
        date: request[:date],
        vendor: Vendor.find_by(id: vendor_id, deleted_at: nil),
        number: request[:number],
        total: request[:total]
      )

      items = request[:items]
      items.each do |item|
        code_id = item[:code][:id]
        code = Code.find_by(id: code_id, deleted_at: nil)

        Item.create!(
          invoice: Invoice.find_by(id: invoice.id, deleted_at: nil),
          code: code,
          category: Category.find_by(id: code.category_id),
          amount: item[:amount]
        )
      end

      render :status => :ok, :json => {
        invoice: invoice
      }
    end

    def destroy
      invoice_id = params[:id]
      invoice = Invoice.find_by(id: invoice_id, deleted_at: nil)
      vendor_id = invoice.vendor_id
      invoices = Invoice.where(vendor_id: vendor_id, deleted_at: nil)

      vendor_invoices = 0
      invoices.each do |invoice|
        if invoice.vendor_id == vendor_id
          vendor_invoices += 1
        end
      end
      if vendor_invoices == 1
        vendor = Vendor.find_by(id: vendor_id, deleted_at: nil)
        vendor.deleted_at = DateTime.now.to_date
        vendor.save
      end

      code_ids = []
      invoice_items = Item.where(invoice_id: invoice_id, deleted_at: nil)
      invoice_items.each do |invoice_item|
        code_ids.push(invoice_item.code_id)
      end
      code_ids.each do |code_id|
        items_with_code = Item.where(code_id: code_id, deleted_at: nil)
        if items_with_code.count == 1
          code = Code.find_by(id: code_id, deleted_at: nil)
          code.deleted_at = DateTime.now.to_date
          code.save
        end
      end

      if invoice_items.count
        invoice_items.each do |item|
          item.deleted_at = DateTime.now.to_date
          item.save
        end
      end

      invoice.deleted_at = DateTime.now.to_date
      invoice.save

      render :status => :ok, :json => {
        message: 'Destroyed Invoice, Items, and Vendor/Codes as needed.'
      }
    end

end
