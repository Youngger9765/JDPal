class Interest < ActiveRecord::Base

  has_many :interestings
  has_many :users, :through => :interestings
end
