class Post < ActiveRecord::Base
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :comments, dependent: :destroy
  has_attached_file :image, styles: { large: "800x800>", medium: "400x400>", thumbnail: "150x150#" },
      :bucket => 'fourthwallappbucket',
                    :s3_credentials => {
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    }


  validates :title, :body, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def all_categories=(titles)
    categorizations = titles.split(",").map do |title|
      Category.where(title: title.strip).first_or_create!
    end
  end

  def all_categories
    categorizations.map(&:title).join(", ")
  end

  def self.tagged_with(title)
    Category.find_by_name!(title).posts
  end

  def category_titles
    categories.pluck(:name).join(", ")
  end

  def category_titles=(titles)
    categories = titles.split(",").map { |category| Category.where(title: category.squish).first_or_create! }
  end

end
