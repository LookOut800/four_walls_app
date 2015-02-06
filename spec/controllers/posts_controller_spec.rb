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

  describe 'GET new' do
    it 'has a 200 status code' do
      get :new
      expect(response.status).to eq 200
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'assigns @posts' do
      posts = Post.all
      get :new
      expect(assigns(:post)).to be_a_new Post
    end
  end

   describe 'GET show' do
    it 'has a 200 status code' do
      post = Post.create!(valid_attributes)
      get :show, id: post
      expect(response.status).to eq 200
    end

    it 'renders the show template' do
      post = Post.create!(valid_attributes)
      get :show, id: post
      expect(response).to render_template('show')
    end

    it 'assigns @post' do
      post = Post.create!(valid_attributes)
      get :show, id: post
      expect(assigns(:post)).to eq post
    end
  end

  # describe 'POST create' do
  #   context 'with valid attributes' do
  #     it 'saves a new post' do
  #       expect {
  #         post :create, post: valid_attributes
  #       }.to change(Post, :count).by 1
  #     end

  #     it 'assigns @post' do
  #       post :create, post: valid_attributes
  #       expect(assigns(:post)).to be_an Post
  #       expect(assigns(:post)).to be_persisted
  #     end

  #     it 'redirects to the created post' do
  #       post :create, post: valid_attributes
  #       expect(response).to redirect_to(Post.last)
  #     end
  #   end
end
