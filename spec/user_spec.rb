require './app/models/user'

describe User do
  let(:email) { "aru@aru.com" }
  let(:password) { "pass123" }

  it "authenticates the user" do
    user = User.create(email: email, password: password, password_confirmation: password)
    expect(User.authenticate(email, password)).to eq user
  end
end
