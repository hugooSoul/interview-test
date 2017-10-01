class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :requisitions, dependent: :destroy

  validates :birth_date, date: { before: Proc.new { Date.today }, message: 'must be before today' }, on: :update

 def self.from_omniauth(auth)
   where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
     if auth[:info]
       user.email = auth[:info][:email]
       user.first_name = auth[:info][:first_name]
       user.second_name = auth[:info][:middle_name]
       user.first_last_name = auth[:info][:last_name]
       user.second_last_name = auth[:info][:last_name]
       user.birth_date = auth[:info][:birthday]
       user.gender = auth[:info][:gender]
     end
     user.password = Devise.friendly_token[0,20]
   end
 end

 def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.auth"] && session["devise.auth"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
 end

end
