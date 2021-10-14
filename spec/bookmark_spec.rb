require "bookmark"
require "database_helpers"
require "./lib/database_connection_setup"

describe Bookmark do
  describe ".all" do
    it "returns all bookmarks" do
      DatabaseConnection.setup("bookmark_manager_test")
      #test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com/", title: "Makers Academy")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com/", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq "Makers Academy"
      expect(bookmarks.first.url).to eq "http://www.makersacademy.com/"
    end
  end

  describe ".create" do
    it "creates a new bookmark" do
      bookmark = Bookmark.create(url: "http://www.test.org", title: "Test")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data["id"]
      expect(bookmark.url).to eq "http://www.test.org"
      expect(bookmark.title).to eq "Test"
    end
  end

  describe ".delete" do
    it "deletes a bookmark" do
      bookmark = Bookmark.create(url: "http://www.test.org", title: "Test")
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end

  describe ".find" do
    it "finds a bookmark" do
      #test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      wrong_one = Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com/", title: "Google")

      result = Bookmark.find(id: bookmark.id)

      expect(result.id).to eq bookmark.id
      expect(result.title).to eq "Makers Academy"
      expect(result.url).to eq "http://www.makersacademy.com"
      expect(result.id).to_not eq wrong_one.id
    end
  end

  describe ".update" do
    it "updates a bookmark" do
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      wrong_one = Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.create(url: "http://www.google.com/", title: "Google")

      updated = Bookmark.update(id: bookmark.id, title: "Makers", url: "http://www.makers.tech")

      expect(updated.id).to eq bookmark.id
      expect(updated.title).to eq "Makers"
      expect(updated.url).to eq "http://www.makers.tech"
      expect(updated.id).to_not eq wrong_one.id
    end
  end
end
