require 'rails_helper'

describe PostComment do
  describe '投稿してみる' do
	    it "有効な投稿内容の場合は保存されるか" do
	      expect(FactoryBot.build(:post_comment)).to be_valid
	    end

	    it "commentが150文字以上であれば登録できないこと" do
	      post_comment = build(:post_comment, comment: "a"*151)
	      expect(post_comment).to be_invalid
      end

      it "commentがない場合は登録できないこと" do
        post_comment = build(:post_comment, comment: "")
        expect(post_comment).not_to be_valid
        expect(post_comment.errors[:comment]).to be_present
     end
  end
  
  describe 'アソシエーションのテスト' do
    context 'モデルとの関係' do
    	it 'UserモデルとN:1になっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
      
      it 'StudyTimeモデルとN:1になっている' do
        expect(PostComment.reflect_on_association(:study_time).macro).to eq :belongs_to
      end
    end
  end
end
