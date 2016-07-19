class Product < ActiveRecord::Base
  belongs_to(:purchase)
  validates(:name, :price, presence: true)

  scope(:not_sold, -> do
    where({:sold => false})
  end)
end
