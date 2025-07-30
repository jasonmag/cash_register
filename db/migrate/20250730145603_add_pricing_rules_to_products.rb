class AddPricingRulesToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :bogo, :boolean
    add_column :products, :bulk_quantity, :integer
    add_column :products, :bulk_price, :decimal
    add_column :products, :percent_discount, :decimal
  end
end
