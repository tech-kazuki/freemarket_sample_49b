require 'rails_helper'
require 'faker'

describe UsersController do
  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params: { id: 1 }
      expect(response).to render_template :show
    end
  end
end
