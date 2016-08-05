class Language < ActiveRecord::Base
  has_many :user_language_ships
  has_many :users, :through => :user_language_ships
end
