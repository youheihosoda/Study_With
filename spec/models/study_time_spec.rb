require 'rails_helper'

describe StudyTime do
  describe '投稿してみる' do
	    it "有効な投稿内容の場合は保存されるか" do
	      expect(FactoryBot.build(:study_time)).to be_valid
	    end

	    it "study_methodが150文字以上であれば登録できないこと" do
	      study_time = build(:study_time, study_method: "a"*151)
	      expect(study_time).to be_invalid
      end
  end
  
  describe 'アソシエーションのテスト' do
    context 'モデルとの関係' do
    	it 'StudyTimeTextモデルと1:Nになっている' do
        expect(StudyTime.reflect_on_association(:study_time_texts).macro).to eq :has_many
      end
      
      it 'StudyTextモデルと1:Nになっている' do
        expect(StudyTime.reflect_on_association(:study_texts).macro).to eq :has_many
      end
      
      it 'Photoモデルと1:Nになっている' do
        expect(StudyTime.reflect_on_association(:photos).macro).to eq :has_many
      end
      
      it 'PostCommentモデルと1:Nになっている' do
        expect(StudyTime.reflect_on_association(:post_comments).macro).to eq :has_many
      end
      
      it 'Favoritesモデルと1:Nになっている' do
        expect(StudyTime.reflect_on_association(:favorites).macro).to eq :has_many
      end
      
      it 'StudyTimeTextモデルとN:1になっている' do
        expect(StudyTime.reflect_on_association(:learning_detail).macro).to eq :belongs_to
      end
      
      it 'UserモデルとN:1になっている' do
        expect(StudyTime.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end