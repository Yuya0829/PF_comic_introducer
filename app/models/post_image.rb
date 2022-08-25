class PostImage < ApplicationRecord

  validates :image, presence: true
  validates :comic_name, presence: true
  validates :user_id, presence: true

  has_one_attached :image

  belongs_to :user

  has_many :post_image_genres
  has_many :genres, through: :post_image_genres, dependent: :destroy

  has_many :post_comments, dependent: :destroy

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

end
