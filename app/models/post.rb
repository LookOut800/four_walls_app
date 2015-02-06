class Post < ActiveRecord::Base
  has_many :pictures

  validates :title, :body, presence: true
end
