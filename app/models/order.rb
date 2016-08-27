class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_interestings
  has_many :interests, :through => :order_interestings

  def tour_guide_ids
  end
  
end
