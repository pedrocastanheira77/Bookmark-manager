feature '7. Checking email format' do
  scenario 'email format is wrong' do
    visit '/'
    fill_in(:email, with: 'lauren')
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1234')
    expect{click_button("Signup")}.to change(User, :count).by(0)
  end

  scenario 'email is empty' do
    visit '/'
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1234')
    expect(current_path).to eq('/users/new')
  end
end
