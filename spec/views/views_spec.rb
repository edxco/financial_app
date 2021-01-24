require 'spec_helper'

RSpec.describe 'Sing in Views', type: :feature do
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

  scenario 'sign in redirect to main menu' do
    visit 'login'
    fill_in 'session_username', with: 'test1'
    click_button('Log in')
    expect(page).to have_content('TEST1')
  end

  scenario 'log out redirect to root' do
    visit 'login'
    fill_in 'session_username', with: 'test1'
    click_button('Log in')
    find('a', text: 'Log out').click
    expect(page).to have_content('Login to Edx Wallet')
  end
end
