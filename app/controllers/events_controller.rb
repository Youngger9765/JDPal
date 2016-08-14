class EventsController < ApplicationController

  def index
    @users = User.is_tour_guide
  end
end
