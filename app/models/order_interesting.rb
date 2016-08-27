class OrderInteresting < ActiveRecord::Base
  belongs_to :order
  belongs_to :interest
end
