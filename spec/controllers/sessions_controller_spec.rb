require 'rails_helper'

describe SessionsController, type: :controller do
  describe '#create' do
    specify 'success log in' do
      post :create, password: 'password'
      expect(response).to redirect_to root_path
    end
    specify 'fail log in' do
      post :create, password: 'foo'
      expect(response).to render_template :new
    end
  end
end
