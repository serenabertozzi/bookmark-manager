feature 'Viewing bookmarks' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content("Bookmark Manager")
  end

  scenario 'shows a list of bookmarks' do
    bookmarks = ["Website1", "Website2", "Website3"]
    visit('/bookmarks')
    expect(page).to have_content(bookmarks.join(' '))
  end
end