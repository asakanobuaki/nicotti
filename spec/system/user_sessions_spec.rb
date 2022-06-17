require 'rails_helper'

RSpec.describe "UserSessions", type: :system,js: true do
  let(:user) { create(:user)}

  describe 'ログイン' do
    context '正常系' do
      it 'ログイン処理が成功する' do
        visit root_path
        find(".btn-outline-success").click
        click_link 'ログイン'
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'

        expect(page).to have_content 'ログインしました'
        expect(current_path).to eq users_path
      end
    end

    context '異常系' do
      it 'フォームが未入力の場合、ログインに失敗する' do
        visit login_path

        fill_in 'メールアドレス', with: nil
        fill_in 'パスワード', with: nil
        click_button 'ログイン'

        expect(page).to have_content 'ログインできませんでした'
        expect(current_path).to eq login_path
      end
    end
  end

  describe 'ログアウト' do
    context '正常系' do 
      before { login(user) }

      it 'ログアウト処理が成功する' do
        find(".toast-success").click
        find('.bi-list').click
        click_link 'ログアウト'

        expect(page).to have_content 'ログアウトしました'
        expect(current_path).to eq root_path
      end
    end
  end

  describe 'ゲストログイン' do
    context '正常系' do
      it 'ゲストログインボタンを押すと正常にログインできる' do
        visit root_path
        expect {
          click_link 'ゲストログイン'
          expect(page).to have_content 'ゲストでログインしました'
        }.to change(User, :count).by(1)

        expect(current_path).to eq users_path
      end
    end
  end

  describe 'ゲストログアウト' do
    before do
      visit root_path
      click_link 'ゲストログイン'
    end
      
    context '正常系' do
      it 'ログアウトボタンを押すと、正常にログアウトできる' do
          find(".toast-success").click
          find('.bi-list').click
          click_link 'ログアウト'

          expect(page).to have_content 'ログアウトしました'
          expect(current_path).to eq root_path
      end
    end
  end
end
