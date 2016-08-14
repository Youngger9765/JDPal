class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :interestings
  has_many :interests, :through => :interestings

  has_many :user_language_ships
  has_many :languages, :through => :user_language_ships

  has_many :user_role_ships
  has_many :roles, :through => :user_role_ships


  def self.from_omniauth(auth)
    # Case 1: Find existing user by facebook uid
    user = User.find_by_fb_uid( auth.uid )
    if user
      user.fb_token = auth.credentials.token
      #user.fb_raw_data = auth
      user.skip_confirmation! 
      user.save!
      return user
    end

    # Case 2: Find existing user by email
    existing_user = User.find_by_email( auth.info.email )
    if existing_user
      existing_user.fb_uid = auth.uid
      existing_user.fb_token = auth.credentials.token

      if !existing_user.name
        existing_user.name = auth.info.name
      end 
      
      if !existing_user.facebook_url
        existing_user.facebook_url = auth.info.urls.Facebook
      end 

      if !existing_user.head_shot
        existing_user.head_shot = auth.info.image
      end
      
      #existing_user.fb_raw_data = auth
      existing_user.skip_confirmation! 
      existing_user.save!
      return existing_user
    end

    # Case 3: Create new password
    user = User.new
    user.fb_uid = auth.uid
    user.fb_token = auth.credentials.token
    user.email = auth.info.email
    user.name = auth.info.name
    user.facebook_url = auth.info.urls.Facebook
    user.head_shot = auth.info.image
    user.password = Devise.friendly_token[0,20]
    #user.fb_raw_data = auth
    user.skip_confirmation! 
    user.save!
    return user
  end

  def self.is_tour_guide
    users = User.all
    ids=[]

    users.each do |user|
      if user.roles.pluck('name').include? "tour_guide"
        ids.push(user.id)
      end
    end

    User.where(:id => ids)
  end

  def Mandarin
  end
  def English
  end
  def Japanese
  end
  def Cantonese
  end
  def Taiwanese
  end
  def Korean
  end
  def Spanish
  end
  def French
  end
  def German
  end
  def others
  end
end
