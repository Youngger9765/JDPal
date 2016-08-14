class Role < ActiveRecord::Base

  has_many :user_role_ships
  has_many :users, :through => :user_role_ships
end
