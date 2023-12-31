require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET #index' do
    it 'renders the index template' do
      get home_path
      expect(response).to render_template('index')
    end
  end
end
