require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #show' do
    before { get '/users/1/posts/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'have the right text' do
      expect(response.body).to include('Show selected post from user')
    end
  end

  describe 'GET #index' do
    before { get '/users/1/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('index')
    end
    it 'have the right text' do
      expect(response.body).to include('Show all user posts')
    end
  end
end
