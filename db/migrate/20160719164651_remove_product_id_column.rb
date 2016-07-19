class RemoveProductIdColumn < ActiveRecord::Migration
  def change
    remove_column(:purchases, :product_ids, :string)
  end
end
