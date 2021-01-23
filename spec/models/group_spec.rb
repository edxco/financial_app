require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    u1 = User.new({ username: 'Test1' })
    pic_path = './app/assets/images/face11.jpg'
    u1.avatar.attach(
      io: File.open(pic_path),
      filename: 'face11.jpg',
      content_type: 'image/jpeg'
    )
    u1.save
  end

    context 'test group model' do
      it { should belong_to(:user) }
      it { should have_many(:transactions) }
    
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:icon) }

      it { validate_uniqueness_of(:name) }
    end

    subject { Group.new name: 'this is group' }
    context "When group is created" do
      it "Name should be capitalized on each word" do
        subject.run_callbacks :save
        expect(subject.name).to eq('This Is Group')
      end
    end

    it 'return true if group is invalid duplicate name' do
      g1 = Group.new(name: 'testgroup 1', icon: 'fa fa-handshake', user_id: 1)
      g1.save
      g1 = Group.new(name: 'testgroup 1', icon: 'fa fa-handshake', user_id: 1)
      expect(g1.valid?).to eq(false)
    end

    it 'return true if group is missing the name' do
      g1 = Group.new(icon: 'fa-handshake', user_id: 1)
      expect(g1.valid?).to eq(false)
    end
  
end
