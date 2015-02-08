class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, styles: { large: "800x800>", medium: "400x400>", thumbnail: "150x150#" }

  validates :title, :body, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
