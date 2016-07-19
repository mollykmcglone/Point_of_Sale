class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.column(:product_ids, :string)

      t.timestamps()
    end
  end
end
