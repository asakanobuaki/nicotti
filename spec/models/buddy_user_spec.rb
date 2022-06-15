require 'rails_helper'

RSpec.describe BuddyUser, type: :model do
  it 'user_idとbuddy_idが存在すると有効な状態である' do
    buddy_user = build(:buddy_user)
    expect(buddy_user).to be_valid
  end
end
