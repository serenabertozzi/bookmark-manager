require "bookmark"

describe Bookmark do
  describe "#all" do
    it "returns all bookmarks" do
      expect(Bookmark.all).to include("Website1")
      expect(Bookmark.all).to include("Website2")
      expect(Bookmark.all).to include("Website3")
    end
  end
end
