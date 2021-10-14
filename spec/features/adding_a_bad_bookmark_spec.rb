require "pg"
require 'uri'

feature "Trying to add a bad bookmark" do
  scenario "adding a new bookmark to the list" do
    visit("/bookmarks/new")
    fill_in("url", with: "not a url")
    fill_in("title", with: "This is a bad bookmark")
    click_button("Add bookmark")

    expect(page).to have_content ("That is not a valid URL.")
    expect(page).to_not have_link("This is a bad bookmark", href: "not a url")
  end
end
