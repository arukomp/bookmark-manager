feature 'user registration' do
  scenario 'allow a new user to sign up' do
    expect{ sign_up }.to change(User, :count).by (1)
    expect(page).to have_content "Welcome, bartjudge@gmail.com"
    expect(User.first.email).to eq "bartjudge@gmail.com"
  end

  scenario 'incorrect password denies user registration' do
    expect{ sign_up(password_confirmation: 'cats') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'user can not register with an invalid emaill address' do
    expect {sign_up(email: nil)}.not_to change(User, :count)
    expect(current_path).to eq '/users'
    end

    scenario 'user can not register with invalid formatted emaill address' do
      expect {sign_up(email: "bartjudgegmail.com")}.not_to change(User, :count)
      expect(current_path).to eq '/users'
    end

    scenario 'cannot sign up with already registered address' do

      sign_up
      expect{ sign_up }.not_to change(User, :count)
      expect(page).to have_content 'Email already registered'

    end

end
