class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :post, index: true
      t.belongs_to :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :categorizations, :posts
    add_foreign_key :categorizations, :categories
  end
end
