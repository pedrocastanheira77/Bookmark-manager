feature '9. A user can sign in' do
 scenario 'When user inserts email and password a welcome message is displayed' do
   @user = User.create( email: "jose@makers.com",
                        password: "1234",
                        password_confirmation: "1234"
   )
   user_signin
   expect(page).to have_text("Welcome, jose@makers.com")
 end
end
