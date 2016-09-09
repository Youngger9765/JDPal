class UsersController < ApplicationController

  layout "application"

  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!, except: [:index, :clause, :contact, :send_mail]
  before_action :find_user, only: [:show, :edit, :update, :upload]
  
  def index
    @users = User.all
  end

  def show
    # @photos = @user.photos.all
  end

  def edit
  end

  def update
    if user_language_params
      for language in user_language_params.keys
        language_id = Language.all.find_by(name: language).id
        level = user_language_params[language]
        
        if @user.user_language_ships.find_by(language_id: language_id)
          ship = @user.user_language_ships.find_by(language_id: language_id)
          ship.update(:level => level)
        else
          @user.user_language_ships.create(language_id: language_id, level: level)
        end
      end
    end
    
    if @user.update(user_params)
      flash[:notice] = "更新成功!"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def find_user
    @user = User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nick_name, :profession, :head_shot,
                                 :description_English, :description_Chinese,
                                 :availability, :travel_footprints,
                                 :familiar_areas, :facebook_url, 
                                 :country, :phone_number, :birthday, :gender,
                                 :social_media_id,
                                 :interest_ids =>[],
                                 :language_ids =>[],
                                )
  end

  def user_language_params
    params.require(:user).permit( :Mandarin, :English, :Japanese, :Cantonese,
                                  :Taiwanese, :Korean, :Spanish, :French,
                                  :German, :others,
                                )
  end

  def correct_user
    @user = current_user
  end

end
