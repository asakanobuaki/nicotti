require 'rails_helper'

RSpec.describe PerDaySmoking, type: :model do

  let(:user) { create(:user) }

  it 'user_id, number_of_smoking, smoked_onがあれば有効であること' do
    per_day_smoking = create(:per_day_smoking)
    expect(per_day_smoking).to be_valid
  end

  it 'user_idがなければ無効であること' do
    per_day_smoking = build(:per_day_smoking, :no_user_id)
    expect(per_day_smoking).to_not be_valid
  end

  it '同じユーザーで同日のsmoked_onであれば無効であること' do
    other_per_day_smoking = create(:per_day_smoking, user: user)
    per_day_smoking = build(:per_day_smoking, user: user)
    expect(per_day_smoking).to_not be_valid
  end
end
