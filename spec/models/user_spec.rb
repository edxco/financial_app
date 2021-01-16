require 'rails_helper'

RSpec.describe User, type: :model do
  context 'test creation valid user' do
    it 'return true if is created a valid user' do
      u1 = User.new({ username: 'Test1' })
      pic_path = './app/assets/images/face11.jpg'
      u1.avatar.attach(
      io: File.open(pic_path),
      filename: 'face11.jpg',
      content_type: 'image/jpeg'
    )
      u1.save
      expect(u1.valid?).to eq(true)
    end

    it 'return false if is created invalid user with duplicate name' do
      u1 = User.new({ username: 'Test1' })
      pic_path = './app/assets/images/face11.jpg'
      u1.avatar.attach(
      io: File.open(pic_path),
      filename: 'face11.jpg',
      content_type: 'image/jpeg'
    )
      u1.save
      u1 = User.new({ username: 'Test1' })
      pic_path = './app/assets/images/face11.jpg'
      u1.avatar.attach(
      io: File.open(pic_path),
      filename: 'face11.jpg',
      content_type: 'image/jpeg'
    )
      expect(u1.valid?).to eq(false)
    end

    it 'create invalid user with out avatar' do
      u1 = User.new({ username: 'Test1'})
      expect(u1.valid?).to eq(false)
    end

  end
end
