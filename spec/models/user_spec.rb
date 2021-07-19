require 'rails_helper'

describe User do
 describe '#create' do

   # 1
   it "nickname、email、passwordとpassword_confirmationが存在すれば登録できること" do
     user = build(:user)
     expect(user).to be_valid
   end
end
end

