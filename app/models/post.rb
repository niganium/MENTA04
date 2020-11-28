class Post < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :content, length: { maximum: 140 }
  end
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
