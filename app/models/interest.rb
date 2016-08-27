class Interest < ActiveRecord::Base

  has_many :interestings
  has_many :users, :through => :interestings

  has_many :order_interestings
  has_many :orders, :through => :interestings
end
