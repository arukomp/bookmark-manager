# As a time-pressed user
# So that I can organise my many links into different categories for ease of search
# I would like to tag links in my bookmark manager

feature "adding tags" do
  scenario "user can add a tag to a link" do
    visit '/links/new'

    fill_in "Title", with: "Makers Academy"
    fill_in "URL", with: "http://www.makersacademy.com"
    fill_in "tags", with: "code"
    click_button "Add"
    expect(page).to have_content "code"
  end
end
