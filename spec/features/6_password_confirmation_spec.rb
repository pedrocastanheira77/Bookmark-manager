feature '6. Password confirmation' do

  scenario 'password confirmation not matching password' do
    visit '/'
    fill_in(:email, with: 'lauren@makers.com')
    fill_in(:password, with: '1234')
    fill_in(:password_confirmation, with: '1235')
    click_button 'Signup'
    expect(page).to have_text("Password and Password Confirmation mismatch")
  end

end
