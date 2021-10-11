require "sinatra/base"
require "sinatra/reloader"

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = ["Website1", "Website2", "Website3"]
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
