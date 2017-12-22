class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :trackable,
  devise :database_authenticatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :projects, dependent: :destroy
  has_many :comments

  ROLES = %i[admin user]

  validates :email, :password, presence: true

  def self.sign_in_from_facebook(auth)
  	
  	where(facebook_id: auth.uid).first_or_create() do |user|
  		user.email = auth.info.email
      user.first_name = auth.info.first_name;
      user.last_name = auth.info.last_name;
  		user.password = Devise.friendly_token[0, 20]
      user.role = "user"
  	end
  end
end
