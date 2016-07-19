class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:price, :float)
      t.column(:sold, :boolean)

      t.timestamps()
    end
  end
end
