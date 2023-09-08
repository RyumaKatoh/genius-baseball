class Practice < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many_attached :videos

  # 日付検索機能実装のため
  ransacker :created_at_gteq, type: :date do
    arel_table[:created_at].gteq(val)
  end

  ransacker :created_at_lteq, type: :date do
    arel_table[:created_at].lteq(val)
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :player
  belongs_to :attempt

  #ジャンルの選択が「---」の時は保存できないようにする
  validates :player_id, numericality: { other_than: 1, message: "can't be black" }
  validates :attempt_id, numericality: { other_than: 1, message: "can't be black" }


  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :videos
  end

  # validate :avatar_size

  def self.ransackable_attributes(auth_object = nil)
    ["player_id", "attempt_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  # def avatar_size
  #   avatars.each do |avatar|
  #     if avatar.blob.byte_size > 100.megabytes
  #       avatar.purge
  #       errors.add(:avatars, "は1つのファイル100MB以内にしてください")
  #     end
  #   end
  # end
end
