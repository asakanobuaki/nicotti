require 'rails_helper'

RSpec.describe User, type: :model do
  it 'FactoryBotでユーザーを作成できる' do
    expect(create(:user)).to be_valid
  end

  it 'name,email,password,password_confirmaiton,target_numberがあれば有効な状態であること' do 
    user = User.new(
      name: "testuser",
      email: "test@test.com",
      password: "password",
      password_confirmation: "password",
      target_number: 5,
      invite_code: "bID1234567a"
    )
    expect(user).to be_valid
  end

  it '名前がなければ無効な状態であること' do
    user = build(:user, name: nil )
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it 'メールアドレスがなければ無効な状態であること' do
    user = build(:user, email: nil )
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it 'パスワードがなければ無効な状態であること' do
    user = build(:user, password: nil )
    user.valid?
    expect(user.errors[:password]).to include("は3文字以上で入力してください")
  end

  it 'パスワードが３文字以上でなければ無効な状態であること' do
    user = build(:user, 
                  password: nil,
                  password_confirmation: nil
                )
    user.valid?
    expect(user.errors[:password]).to include("は3文字以上で入力してください")
  end

  it '目標喫煙本数がなければ無効な状態であること' do
    user = build(:user, target_number: nil )
    user.valid?
    expect(user.errors[:target_number]).to include("を入力してください")
  end

  it '重複したメールアドレスであれば無効であること' do
    other_user = create(:user, email: "test@test.com")
    user = build(:user, email: "test@test.com")
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end
end
