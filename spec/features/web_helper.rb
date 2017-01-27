def user_signup
  visit '/users/new'
  fill_in(:email, with: "lauren@makers.com")
  fill_in(:password, with: "1234")
  click_button("Signup")
end
