require 'rails_helper'

RSpec.describe Public::UsersController, type: :controller do
 describe "#show" do
   before do
    @user = FactoryBot.create(:user)
   end
    # 正常なレスポンスか？
    it "responds successfully" do
      get :show, params: {id: @user.id}
      expect(response).to be_success
    end
 end
end