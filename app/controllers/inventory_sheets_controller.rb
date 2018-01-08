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
    existing_inventory_sheet = InventorySheet.find_by(date: request[:date], deleted_at: nil)
    if existing_inventory_sheet
      render :status => 400, :json => { errorMessage: "Inventory sheet already exists for this date." }
    else
      inventory_sheet = InventorySheet.create!(
        date: request[:date],
        beer_total: request[:beerTotal],
        wine_total: request[:wineTotal],
        food_total: request[:foodTotal]
      )

      render :status => :ok, :json => {
        inventorySheetId: inventory_sheet.id
      }
    end
  end

  def destroy
    inventory_sheet = InventorySheet.find_by(id: params[:id], deleted_at: nil)
    inventory_sheet.deleted_at = DateTime.now.to_date
    inventory_sheet.save

    reports_to_delete = Report.where(start_inventory_sheet_id: inventory_sheet.id, deleted_at: nil).or(Report.where(end_inventory_sheet_id: inventory_sheet.id, deleted_at: nil))
    reports_to_delete.each do |report|
      report.deleted_at = DateTime.now.to_date
      report.save
    end

    render :status => :ok, :json => {
      message: 'Destroyed Inventory Sheet.'
    }
  end

end
