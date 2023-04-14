class Book < ApplicationRecord
  belongs_to :user #userモデルと関連付ける
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true #titleカラムの設定
  validates :body, presence: true, length: {maximum: 200}
  
  def favorited_by?(user) 
    favorites.exists?(user_id: user.id)
  end
end
