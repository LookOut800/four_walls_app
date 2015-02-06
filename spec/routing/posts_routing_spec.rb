require 'rails_helper'

RSpec.describe 'routes for posts' do
  it 'routes GET /posts to the posts controller' do
    expect(get('/posts')).to route_to('posts#index')
  end
end
