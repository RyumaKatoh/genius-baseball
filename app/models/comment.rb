class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :practice
  has_one_attached :video

  with_options presence: true do
    validates :content, unless: :was_attached?
  end

  def was_attached?
    self.video.attached?
  end  
end
