class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: "800x800>", medium: "400x400>", thumbnail: "150x150#" },
      :bucket => 'fourthwallappbucket',
                    :s3_credentials => {
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }


  validates :title, :body, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
