class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :topics
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :liked_bookmarks, through: :likes, source: :bookmark

  before_save { self.role ||= :member }

  enum role: [:member, :admin]

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
