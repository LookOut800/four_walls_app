class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, styles: { large: "800x800>", medium: "400x400>", thumbnail: "150x150#" }
     default_url: "/images/:style/missing.png",
   :url  => ":s3_domain_url",
    :path => "posts/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]





  validates :title, :body, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
