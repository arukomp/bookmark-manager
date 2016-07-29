module SessionHelpers

def sign_up(email: 'bartjudge@gmail.com', password: 'password', password_confirmation: "password")
  visit '/users/new'
  # expect(page.status_code).to eq 200

  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Register'

end

def sign_in
  visit '/users/login'
  fill_in :email, with: 'bartjudge@gmail.com'
  fill_in :password, with: 'password'
  click_button 'Login'
end

def sign_out
  click_button 'Log out'
end

end
