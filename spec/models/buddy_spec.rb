require 'rails_helper'

RSpec.describe Buddy, type: :model do
  it 'line_id, name, buddy_imageがあれば有効な状態であること' do
    buddy = build(:buddy)
    expect(buddy).to be_valid
  end

  it 'line_idがなければ無効な状態であること' do
    buddy = build(:buddy, line_id: nil)
    expect(buddy).to_not be_valid
  end

  it '重複したline_idは無効な状態であること' do 
    other_buddy = create(:buddy)
    buddy = build(:buddy, line_id: other_buddy.line_id)
    expect(buddy).to_not be_valid
  end
end
