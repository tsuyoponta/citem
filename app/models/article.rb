class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: { message: 'を選択してください' }

  with_options presence: true do
    validates :title
    validates :text
  end
end
