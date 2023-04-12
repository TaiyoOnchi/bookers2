class Book < ApplicationRecord
  belongs_to :user #userモデルと関連付ける
  
  validates :title, presence: true #titleカラムの設定
  validates :body, presence: true, length: {maximum: 200}
end
