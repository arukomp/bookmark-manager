feature 'signing out' do

  scenario 'allows a user to sign out' do
    
    sign_up
    sign_in
    sign_out
    expect(page).not_to have_content 'Welcome, bartjudge@gmail.com'
    expect(page).to have_content 'Goodbye, bartjudge@gmail.com'
    expect(current_path).to eq '/links'

  end

end
