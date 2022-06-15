require 'rails_helper'

RSpec.describe Smoking, type: :model do

  let(:user) { create(:user) }

  it 'user_idがあれば有効であること' do
    smoking = build(:smoking)
    expect(smoking).to be_valid
  end

  it 'user_idがなければ無効であること' do
    smoking = build(:smoking, :invalid)
    expect(smoking).to_not be_valid
  end
end
