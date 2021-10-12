require "pg"

feature "Viewing bookmarks" do
  scenario "visiting the home page" do
    visit("/")
    expect(page).to have_content("Bookmark Manager")
  end

  scenario "shows a list of bookmarks" do
    Bookmark.create(url: "http://www.makersacademy.com/")
    Bookmark.create(url: "http://www.destroyallsoftware.com")
    Bookmark.create(url: "http://www.google.com/")

    bookmarks = ["http://www.makersacademy.com/", "http://www.destroyallsoftware.com", "http://www.google.com/"]
    visit("/bookmarks")
    expect(page).to have_content(bookmarks.join(" "))
  end
end
