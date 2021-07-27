require 'rails_helper'

describe LearningDetail do
  describe '投稿してみる' do
	    it "有効な投稿内容の場合は保存されるか" do
	      expect(FactoryBot.build(:learning_detail)).to be_valid
	    end

	    it "detailが30文字以上であれば登録できないこと" do
	      learning_detail = build(:learning_detail, detail: "a"*31)
	      expect(learning_detail).to be_invalid
      end

      it "detailがない場合は登録できないこと" do
        learning_detail = build(:learning_detail, detail: "")
        learning_detail.valid?
     end
  end
end