feature '09. A user can sign in' do
 scenario 'When user inserts email and password a welcome message is displayed' do
   user_signup
   user_signin
   expect(page).to have_text("Welcome, josepedrocastanheira@gmail.com")
 end
end
