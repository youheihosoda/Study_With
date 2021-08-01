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
        expect(study_text).to be_invalid
     end
  end
  
  describe 'アソシエーションのテスト' do
    context 'モデルとの関係' do
    	it 'StudyTimeTextモデルと1:Nになっている' do
        expect(StudyText.reflect_on_association(:study_time_texts).macro).to eq :has_many
      end
      
      it 'StudyTimeモデルと1:Nになっている' do
        expect(StudyText.reflect_on_association(:study_times).macro).to eq :has_many
      end

      it 'UserモデルとN:1になっている' do
        expect(StudyText.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end