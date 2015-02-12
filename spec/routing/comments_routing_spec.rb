require 'rails_helper'

RSpec.describe 'routes for comments' do
  it 'routes GET /posts/post_id/comments to the comments controller' do
    expect(get('/posts/1/comments')).to route_to('comments#index', post_id: "1" )
  end
end
