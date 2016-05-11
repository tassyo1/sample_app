require 'rails_helper'


RSpec.describe StaticPagesController,  type: :controller do

  
  describe 'GET #home' do 
    before(:each) do
      get :home
    end

    it "return http success" do
      expect(response).to be_success 
    end
  end

  describe "GET #about" do
    before(:each) do
      get :about
    end

    it 'return http success' do
      expect(response).to be_success
    end
  end
end
