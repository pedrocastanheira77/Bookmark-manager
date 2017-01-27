feature '6. Password confirmation' do

  scenario 'password confirmation not matching password' do
    visit '/'
    fill_in(:email, with: 'lauren@makers.com')
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1235')
    expect{click_button 'Signup'}.not_to change{User.count}.by(1)
  end

end
