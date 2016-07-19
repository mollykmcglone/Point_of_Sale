class AddPurchaseIdToProducts < ActiveRecord::Migration
  def change
    add_column(:products, :purchase_id, :int)
  end
end
