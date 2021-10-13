require "pg"

feature "Adding bookmark" do
  scenario "adding a new bookmark to the list" do
    visit("/bookmarks/new")
    fill_in("url", with: "http://www.github.com/")
    fill_in("title", with: "GitHub")
    click_button("Add bookmark")

    expect(page).to have_link("GitHub", href: "http://www.github.com/")
  end
end
