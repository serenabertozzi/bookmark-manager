require "pg"

feature "Adding bookmark" do
  scenario "adding a new bookmark to the list" do
    visit("/bookmarks/new")
    fill_in("url", with: "http://www.github.com/")
    click_button("Add bookmark")

    expect(page).to have_content("http://www.github.com/")
  end
end
