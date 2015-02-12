class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      # t.belongs_to :post, index: true
    end
    # add_foreign_key :categories, :posts
  end
end
