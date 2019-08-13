
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  post '/input' do
    session[:url] = params[:url]
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @new_bookmark = Bookmark.new
    @new_bookmark.add(session[:url])
    @bookmarks = Bookmark.all
    erb :bookmarks
  end
end
