feature "Signing in" do
  scenario "the user can sign in" do
    sign_up
    visit '/users/login'
    fill_in :email, with: 'bartjudge@gmail.com'
    fill_in :password, with: 'password'
    click_button 'Login'
    expect(page).to have_content "Welcome, bartjudge@gmail.com"
  end
end
