require "pg"

feature "Updating bookmarks" do
  scenario "updating a bookmark" do
    Bookmark.create(url: "http://www.makersacademy.com/", title: "Makers Academy")
    Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.create(url: "http://www.google.com/", title: "Google")

    visit("/bookmarks")
    first(".bookmark").click_button("Edit")
    fill_in :title, with: "Makers"
    fill_in :url, with: "http://www.makers.tech"
    click_button 'Update'

    expect(page).to have_link("Makers", href: "http://www.makers.tech")
    expect(page).not_to have_link("Makers Academy", href: "http://www.makersacademy.com/")
    expect(page).to have_link("Destroy All Software", href: "http://www.destroyallsoftware.com")
  end
end