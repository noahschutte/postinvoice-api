class InventorySheetsController < ApplicationController
  skip_before_action :verify_authenticity_token

    def index
      inventory_sheets = InventorySheet.where(deleted_at: nil)

      render :status => :ok, :json => {
        inventorySheets: inventory_sheets
      }
    end

    def show
      inventory_sheet = InventorySheet.find_by(id: params[:id], deleted_at: nil)

      render :status => :ok, :json => {
        inventorySheet: inventory_sheet
      }
    end

    def create
      invoice_sheet = InventorySheet.create!(
        date: request[:date],
        beer_total: request[:beerTotal],
        wine_total: request[:wineTotal],
        food_total: request[:foodTotal]
      )

      render :status => :ok, :json => {
        invoiceSheet: invoice_sheet
      }
    end

    def destroy
      inventory_sheet = InventorySheet.find_by(id: params[:id], deleted_at: nil)
      inventory_sheet.deleted_at = DateTime.now.to_date
      inventory_sheet.save

      render :status => :ok, :json => {
        message: 'Destroyed Inventory Sheet.'
      }
    end

end
