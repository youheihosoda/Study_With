require 'rails_helper'

describe Contact do
  describe '問い合わせ内容' do
	    it "有効な投稿内容の場合は保存されるか" do
	      expect(FactoryBot.build(:contact)).to be_valid
	    end
  end
end