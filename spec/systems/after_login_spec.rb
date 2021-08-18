require 'rails_helper'
require 'capybara/rspec'
describe '[STEP2] ユーザログイン後のテスト' do
  @user = FactoryBot.build(:user)


  before do
    visit new_user_session_path
    fill_in 'Email', with: 'foo@example.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutは『ユーザログアウトのテスト』でテスト済みになります。' do
      subject { current_path }


      it 'TOPを押すと、勉強開始画面に遷移する' do
        TOP_link = find_all('a')[2].native.inner_text
        click_link TOP_link
        expect( find('navbar-nav box d-flex justify-content-end', visible: false).value ).to eq '/public/study_times/top'
      end
    end
  end

end