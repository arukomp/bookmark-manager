# As a time-pressed user
# So that I can save a website
# I would like to add the site's address and title to my bookmark manager

feature "creating links" do
  scenario "user is able to create a new link" do
    visit '/links'
    click_button "Add a new link"

    expect(page.status_code).to eq 200

    fill_in "Title", with: "GitHub"
    fill_in "URL", with: "http://www.github.com"
    click_button "Add"

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content "GitHub"
    end
  end
end
