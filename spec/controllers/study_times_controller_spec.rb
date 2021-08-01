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

  describe "CRUD機能のテスト" do
    before do
      @user = FactoryBot.create(:user)
      @study_time = @user.study_times.create(study_method: "test")
      request.env["HTTP_REFERER"] = "https://9a0ae72912da4dfbbc874db98c67bdb1.vfs.cloud9.ap-northeast-1.amazonaws.com/public/study_times/top"
      request.env["HTTP_REFERER"] = "https://9a0ae72912da4dfbbc874db98c67bdb1.vfs.cloud9.ap-northeast-1.amazonaws.com/public/users/1"
      request.env["HTTP_REFERER"] = "https://9a0ae72912da4dfbbc874db98c67bdb1.vfs.cloud9.ap-northeast-1.amazonaws.com/public/search?utf8=%E2%9C%93&content=sdf&model=study_time&commit=%E6%A4%9C%E7%B4%A2"
    end

    it "学習開始時刻を取得できるか" do
      sign_in @user
      expect {post :start_time,
      params: {study_time: {study_method: "test",user_id: 1, start_time: 1624180436, end_time: 1624180438}
      }
      }.to change(@user.study_times, :count).by(1)
    end

    it "学習終了時刻を取得できるか" do
      sign_in @user
        study_time_params = {study_method: "test",user_id: 1, start_time: 1624180436, end_time: 1627712035}
        patch :stop_time, params: {id: @study_time.id, study_time: study_time_params}
        @study_time.reload
        expect(@study_time.end_time).to be >= 1624180436
    end

    it "学習時間取得後に投稿画面に遷移するか" do
      sign_in @user
      study_time_params = {study_method: "test",user_id: 1, start_time: 1624180436, end_time: 1624180438}
      patch :stop_time, params: {id: @study_time.id, study_time: study_time_params}
      expect(response).to redirect_to "/public/study_times/1/edit?study_time_id=1"
    end

    it "投稿を削除できるか" do
      sign_in @user
      expect {
      delete :destroy, params: {id: @study_time.id}
      }.to change(@user.study_times, :count).by(-1)
    end

    it "投稿削除後元の画面に遷移されるか" do
      sign_in @user
      delete :destroy, params: {id: @study_time.id}
      expect(response).to redirect_to request.referer
    end
  end
end