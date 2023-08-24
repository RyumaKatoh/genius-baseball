class Practice < ApplicationRecord
  belongs_to :user
  has_many :comments
  # has_many :favorites, dependent: :destroy
  has_one_attached :video
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :player
  belongs_to :attempt

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :player_id, numericality: { other_than: 1, message: "can't be black" }
  validates :attempt_id, numericality: { other_than: 1, message: "can't be black" }


  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :video
  end
end
