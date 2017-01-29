module SessionHelpers
  def user_signup
    visit '/users/new'
    fill_in(:email, with: "josepedrocastanheira@gmail.com")
    fill_in(:password, with: "1234")
    fill_in(:password_confirmation, with: "1234")
    click_button("Sign up")
  end

  def user_signin
    visit '/sessions/new'
    fill_in(:email, with: "josepedrocastanheira@gmail.com")
    fill_in(:password, with: "1234")
    click_button("Sign in")
  end

  def user_signin_new_password
    visit '/sessions/new'
    fill_in(:email, with: "josepedrocastanheira@gmail.com")
    fill_in(:password, with: "newpassword")
    click_button("Sign in")
  end
end
