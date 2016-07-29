feature "Signing in" do
  scenario "the user can sign in" do
    sign_up
    sign_in
    expect(page).to have_content "Welcome, bartjudge@gmail.com"
  end
end
