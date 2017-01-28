feature 'A user can not sign up with an already registered email address' do
 scenario 'Email is unique in the database' do
   user_signup
   expect{user_signup}.to change(User, :count).by(0)
 end

 scenario 'An error message is displayed to the user' do
   user_signup
   user_signup
   expect(page).to have_text("The inserted email is already registered. Choose a different one.")
 end

end
