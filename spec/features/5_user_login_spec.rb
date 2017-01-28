feature '5. User Signup' do
  scenario 'user is able to create account' do
    user_signup
    expect(current_path).to eq("/links")
  end

  scenario 'When user successfully creates their account they will see their email' do
    user_signup
    expect(page).to have_text("lauren@makers.com")
  end

  scenario 'After signup users database will count one more' do
    expect{ user_signup }.to change{ User.count }.by(1)
  end
end
