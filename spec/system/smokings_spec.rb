require 'rails_helper'

RSpec.describe 'Smoking', type: :system do

  let(:user) { create(:user) }
  before do
    login(user)
    visit users_path
  end

  describe 'ホーム画面' do
    context '「一服する」ボタンを押す' do
      it '「一服するボタンを押すと確認画面が出る」' do
        click_button '一服する'
        expect(page).to have_content('喫煙しますか？')
      end
    end
  end
end
