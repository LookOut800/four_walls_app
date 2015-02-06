require 'rails_helper'

RSpec.describe PostsController do
   let(:valid_attributes) {
    { title: 'First brilliant post!', body: "Check out this amazing thing" }
  }

  let(:invalid_attributes) {
    { title: nil, body: nil }
  }

  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq 200
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'assigns @posts' do
      posts = Post.all
      get :index
      expect(assigns(:posts)).to eq posts
    end
  end
end
