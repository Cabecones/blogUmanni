require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:post) { create(:post) }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { post: { title: 'Title', content: 'Content' } } }
    let(:invalid_attributes) { { post: { title: nil, content: nil } } }

    context 'with valid params' do
      it 'creates a new Post' do
        expect do
          post :create, params: valid_attributes
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post :create, params: valid_attributes
        expect(response).to redirect_to(Post.last)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Post' do
        expect do
          post :create, params: invalid_attributes
        end.not_to change(Post, :count)
      end

      it 'returns a success response (i.e. to display the "new" template)' do
        post :create, params: invalid_attributes
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { title: 'New Title' }
      end

      it 'updates the requested post' do
        put :update, params: { id: post.id, post: new_attributes }
        post.reload
        expect(post.title).to eq('New Title')
      end
    end

    context 'with invalid params' do
      it 'returns a success response (i.e. to display the \'edit\' template)' do
        put :update, params: { id: post.id, post: attributes_for(:post, title: nil) }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post
      expect do
        delete :destroy, params: { id: post.id }
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(posts_url)
    end
  end
end
