require 'rails_helper'

RSpec.describe Public::StudyTimesController, type: :controller do
  describe "#top" do
    before do
      @user = FactoryBot.create(:user)
    end
    
    it "topページの表示" do
     sign_in @user
     get :top
     expect(response).to be_success
    end
    
  end
end