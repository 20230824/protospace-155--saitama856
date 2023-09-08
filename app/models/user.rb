class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  with_options presence: true do
    validates :user_name
    validates :user_profile
    validates :user_occupation
    validates :user_position
  end
end
