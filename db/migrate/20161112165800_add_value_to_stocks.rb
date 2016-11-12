class AddValueToStocks < ActiveRecord::Migration
  def change
  	add_column :stocks, :value, :decimal
  end
end
