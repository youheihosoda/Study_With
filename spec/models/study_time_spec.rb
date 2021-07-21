require 'rails_helper'

describe StudyTime do
  describe '投稿してみる' do
	    it "有効な投稿内容の場合は保存されるか" do
	      expect(FactoryBot.build(:study_time)).to be_valid
	    end

	    it "study_methodが150文字以上であれば登録できないこと" do
     　study_time = build(:study_time, study_method: "a" * 151)
     　study_time.valid?
      end
  end
end