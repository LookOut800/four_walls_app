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

  describe 'POST create' do
    context 'with valid attributes' do
      it 'saves a new post' do
        expect {
          post :create, post: valid_attributes
        }.to change(Post, :count).by 1
      end

      it 'assigns @post' do
        post :create, post: valid_attributes
        expect(assigns(:post)).to be_an Post
        expect(assigns(:post)).to be_persisted
      end

      it 'redirects to the created post' do
        post :create, post: valid_attributes
        expect(response).to redirect_to(Post.last)
      end
    end

    context 'with invalid attributes' do
      it 'assigns @post, but does not save a new post' do
        post :create, post: invalid_attributes
        expect(assigns(:post)).to be_a_new Post
      end

      it 're-renders the new template' do
        post :create, post: invalid_attributes
        expect(response).to render_template 'new'
      end
    end
  end


  describe 'GET edit' do
    it 'has a 200 status code' do
      post = Post.create!(valid_attributes)
      get :edit, id: post
      expect(response.status).to eq 200
    end

    it 'renders the edit template' do
      post = Post.create!(valid_attributes)
      get :edit, id: post
      expect(response).to render_template('edit')
    end

    it 'assigns @post' do
      post = Post.create!(valid_attributes)
      get :edit, id: post
      expect(assigns(:post)).to eq post
    end
  end

  describe 'PATCH update' do
    context 'with valid attributes' do
      let(:new_attributes) {
        { title: 'Another Good Idea', body: 'Cant go wrong.' }
      }

      it 'updates the requested post' do
        post = Post.create!(valid_attributes)
        patch :update, id: post, post: new_attributes
        post.reload
        expect(post.title).to eq new_attributes[:title]
      end

      it 'assigns @post' do
        post = Post.create!(valid_attributes)
        patch :update, id: post, post: new_attributes
        expect(assigns(:post)).to eq post
      end

      it 'redirects to the post' do
        post = Post.create!(valid_attributes)
        patch :update, id: post, post: new_attributes
        expect(response).to redirect_to post
      end
    end

    context 'with invalid attributes' do
      it 'assigns @post' do
        post = Post.create!(valid_attributes)
        patch :update, id: post, post: invalid_attributes
        expect(assigns(:post)).to eq post
      end

      it 're-renders the edit template' do
        post = Post.create!(valid_attributes)
        patch :update, id: post, post: invalid_attributes
        expect(response).to render_template('edit')
      end
    end
  end

end
