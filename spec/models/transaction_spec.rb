require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before(:each) do
    u1 = User.new({ username: 'Test1' })
    pic_path = './app/assets/images/face11.jpg'
    u1.avatar.attach(
      io: File.open(pic_path),
      filename: 'face11.jpg',
      content_type: 'image/jpeg'
    )
    u1.save
    g1 = Group.new(name: 'testgroup 1', icon: 'fa fa-handshake', user_id: 1)
    g1.save
  end

  context 'test transaction model' do
    it { should belong_to(:user) }
    it { should belong_to(:group).optional }
  
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
    it 'return false if created transaction is invalid missing name' do
      e1 = Transaction.new(amount: 25, user_id: 1, group_id: 1)
      e1.save
      expect(e1.valid?).to eq(false)
    end

    it 'return false if created transaction is invalid missing amount' do
      e1 = Transaction.new(name: 'Food', user_id: 1, group_id: 1)
      e1.save
      expect(e1.valid?).to eq(false)
    end
  end
end
