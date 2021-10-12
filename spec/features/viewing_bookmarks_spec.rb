require "pg"

feature "Viewing bookmarks" do
  scenario "visiting the home page" do
    visit("/")
    expect(page).to have_content("Bookmark Manager")
  end

  scenario "shows a list of bookmarks" do
    connection = PG.connect(dbname: "bookmark_manager_test")

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com/');")

    bookmarks = ["http://www.makersacademy.com/", "http://www.destroyallsoftware.com", "http://www.google.com/"]
    visit("/bookmarks")
    expect(page).to have_content(bookmarks.join(" "))
  end
end
