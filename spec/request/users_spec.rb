require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #show' do
    before { get '/users/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'have the right text' do
      expect(response.body).to include('Show User with his Index on url')
    end
  end

  describe 'GET #index' do
    before { get '/' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('index')
    end
    it 'have the right text' do
      expect(response.body).to include('Users Index list')
    end
  end
end
