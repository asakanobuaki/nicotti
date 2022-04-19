require 'rails_helper'

RSpec.describe 'Smoking', type: :system do

  let(:user) { create(:user) }
  let(:baldness_user) { create(:user, :baldness) }
  let(:cancer_user) { create(:user, :cancer) }
  let(:reborn_user) { create(:user, :reborn) }

  describe '喫煙登録機能' do
    before do
      login(user)
      visit users_path
    end

    context '「一服する」ボタンを押す' do
      it '「一服する」ボタンを押すと確認画面が出る', js: true do
        find('#js-smoking-buttom').click
        expect(page).to have_text('喫煙しますか?')
        find('.swal2-confirm').click
        expect(page).to have_text('本日 1 回目の喫煙です')
      end

      it '「一服する」ボタンを押すと本日の喫煙レコードが追加される', js: true do
        find('#js-smoking-buttom').click
        expect(page).to have_content('喫煙しますか?')
        find('.swal2-confirm').click
        find('.swal2-confirm').click
        within('.smoking-log') do
          expect(page).to have_content(I18n.l Time.current, format: :short)
        end
      end
    end
  end

  describe 'ニコッチのステータス変更' do
    context '超過喫煙本数が5本の時' do
      before do
        login(baldness_user)
        visit users_path
      end

      it '喫煙するとニコッチのステータスが「ハゲ」になる' do
        find('#js-smoking-buttom').click
        expect(page).to have_content('喫煙しますか?')
        find('.swal2-confirm').click
        find('.swal2-confirm').click
        within('#modalBaldness') do
          expect(page).to have_content('毛が抜け始めました')
        end
        find('.modal-button').click
        # expect(page).to have_selector("img[src$='hagepiyo.gif']")
        expect(page).to have_content('なんだか気分が悪いな')
        expect(page).to have_content('ハゲ')
      end
    end

    context '超過喫煙本数が7本の時' do
      before do
        login(cancer_user)
        visit users_path
      end

      it '喫煙するとニコッチのステータスが「がん」になる' do
        find('#js-smoking-buttom').click
        expect(page).to have_content('喫煙しますか?')
        find('.swal2-confirm').click
        find('.swal2-confirm').click
        within('#modalCancer') do
          expect(page).to have_content('深刻な病気になりました')
        end
        find('.modal-button').click
        expect(page).to have_content('もうだめかもしれない')
        expect(page).to have_content('がん')
      end
    end

    context '超過喫煙本数が9本の時' do
      before do
        login(reborn_user)
        visit users_path
      end

      it '喫煙するとニコッチ甦る' do
        find('#js-smoking-buttom').click
        expect(page).to have_content('喫煙しますか?')
        find('.swal2-confirm').click
        find('.swal2-confirm').click
        within('#modalDead') do
          expect(page).to have_content('ニコッチが亡くなりました')
        end
        find('.modal-button-reborn').click
        expect(page).to have_content('今日もすこぶる体調がいいよ')
        expect(page).to have_content('健康')
      end
    end
  end
end
