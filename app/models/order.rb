class Order < ActiveRecord::Base
  belongs_to :user

  def tour_guide_ids
  end
  
end
