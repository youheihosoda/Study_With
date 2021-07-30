require 'rails_helper'

RSpec.describe Public::StudyTimesController, type: :controller do
  describe "ページの表示" do
    before do
      @user = FactoryBot.create(:user)
      @study_time = @user.study_times.create(study_method: "test")
    end

    it "topページの表示" do
     sign_in @user
     get :top
     expect(response).to be_success
    end

    it "showページの表示" do
      sign_in @user
      get :show, params: {id: @study_time.id}
      expect(response).to be_success
    end
    
    it "indexページの表示" do
      sign_in @user
      get :index, params: {id: @study_time.id}
      expect(response).to be_success
    end
    
    it "editページの表示" do
      sign_in @user
      get :edit, params: {id: @study_time.id}
      expect(response).to be_success
    end
  end
end