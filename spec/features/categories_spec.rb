require 'rails_helper'

RSpec.feature 'Managing Categories' do
  scenario 'List all Categories for a given post' do
    post = Post.create!(title: 'X-Files 2', body: "the truth is out there")
    Category.create!(title: 'Beauty is in the eye', post: post )
    Category.create!(title: 'Beauty is in the eye', post: post )
    Category.create!(title: 'Beauty is in the eye', post: post )

    visit "/post/#{post.id}/categories"

    expect(page).to have_content 'Categories'
  end
end
