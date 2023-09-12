class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  
  with_options presence: true do
    validates :user_id
    validates :prototype_title
    validates :prototype_catch_copy
    validates :prototype_concept
    validates :image
  end
end
