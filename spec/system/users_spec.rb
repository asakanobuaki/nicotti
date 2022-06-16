require 'rails_helper'

RSpec.describe "Users", type: :system do

  describe 'ユーザー新規登録' do

    before do 
      visit new_user_path
    end

    context '正常系', js: true do
      it 'フォームの必須項目全て入力するとユーザー登録される' do
        expect {
          fill_in 'user[name]', with: "テストユーザー" 
          fill_in "user[email]", with: "test@example.com"
          fill_in "user[password]", with: "test123"
          fill_in "user[password_confirmation]", with: "test123"
          fill_in "user[target_number]", with: 5
          click_button "新規登録"
        }.to change(User, :count).by(1)

        expect(page).to have_content "ユーザーを作成しました"
        expect(current_path).to eq users_path
        expect(page).to have_content "健康"
      end
    end

    context '異常系', js: true do
      it '名前が未入力の場合、エラーメッセージが表示されること' do
        expect {
          fill_in 'user[name]', with: nil  
          fill_in "user[email]", with: "test@example.com"
          fill_in "user[password]", with: "test123"
          fill_in "user[password_confirmation]", with: "test123"
          fill_in "user[target_number]", with: 5
          click_button "新規登録"

          expect(page).to have_content "名前を入力してください"
        }.to_not change(User, :count)
      end

      it '重複したメールアドレスの場合、エラーメッセージが表示されること' do
        user = create(:user)
        expect {
          fill_in 'user[name]', with: "テストユーザー"
          fill_in "user[email]", with: user.email
          fill_in "user[password]", with: "test123"
          fill_in "user[password_confirmation]", with: "test123"
          fill_in "user[target_number]", with: 5
          click_button "新規登録"

          expect(page).to have_content "メールアドレスはすでに存在します"
        }.to_not change(User, :count)
      end

      it 'パスワードが３文字未満の場合、エラーメッセージが表示されること' do
        expect {
          fill_in 'user[name]', with: "テストユーザー"
          fill_in "user[email]", with: "test@example.com"
          fill_in "user[password]", with: "te"
          fill_in "user[password_confirmation]", with: "te"
          fill_in "user[target_number]", with: 5
          click_button "新規登録"

          expect(page).to have_content "パスワードは3文字以上で入力してください"
        }.to_not change(User, :count)
      end

      it 'パスワード確認とパスワードの入力が一致しない場合、エラーメッセージが表示されること' do
        expect {
          fill_in 'user[name]', with: "テストユーザー"
          fill_in "user[email]", with: "test@example.com"
          fill_in "user[password]", with: "test123"
          fill_in "user[password_confirmation]", with: "test"
          fill_in "user[target_number]", with: 5
          click_button "新規登録"

          expect(page).to have_content "パスワード確認とパスワードの入力が一致しません"
        }.to_not change(User, :count)
      end

      it '目標喫煙本数に実数が入力された場合、新規登録されない' do
        expect {
          fill_in 'user[name]', with: "テストユーザー"
          fill_in "user[email]", with: "test@example.com"
          fill_in "user[password]", with: "test123"
          fill_in "user[password_confirmation]", with: "test123"
          fill_in "user[target_number]", with: 5.8
          click_button "新規登録"
        }.to_not change(User, :count)
      end
    end
  end
end
