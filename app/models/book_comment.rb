class BookComment < ApplicationRecord
  belongs_to :user #userモデルと関連付ける
  belongs_to :book #bookモデルと関連付ける
  
  validates :comment, presence: true
end
