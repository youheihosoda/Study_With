require 'rails_helper'

describe StudyText do
  describe '投稿してみる' do
	    it "有効な投稿内容の場合は保存されるか" do
	      expect(FactoryBot.build(:study_text)).to be_valid
	    end

	    it "nameが30文字以上であれば登録できないこと" do
	      study_text = build(:study_text, name: "a"*31)
	      expect(study_text).to be_invalid
      end
      
      it "nameがない場合は登録できないこと" do
        study_text = build(:study_text, name: "")
        study_text.valid?
     end
  end
end