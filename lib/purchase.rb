class Purchase < ActiveRecord::Base
  has_many(:products)

  scope(:between, -> (start_date, end_date) do
    where({created_at: start_date.to_time.beginning_of_day..end_date.to_time.end_of_day})
  end)
end
