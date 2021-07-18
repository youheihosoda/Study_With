require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
	  describe 'バリデーション' do
	    it "有効なユーザー情報は保存されるか" do
	      expect(FactoryBot.build(:user)).to be_valid
	    end
	  end
	  context "空白のバリデーションチェック" do
	    it "nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
	      user.name = ''
	      is_expected.to eq false;
	    end
    end
end



