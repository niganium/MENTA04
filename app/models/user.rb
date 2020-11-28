class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  with_options presence: true do
    validates :name, length: { maximum: 30 }
    validates :email, uniqueness: true, length: { maximum: 255 }
    validates :password, length: { minimum: 7 }
  end
  has_secure_password
end
