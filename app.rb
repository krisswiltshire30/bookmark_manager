
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    @all_bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :'/bookmarks/new'
  end

  post '/input' do
    Bookmark.add(title: params[:title], url: params[:url])
    redirect '/'
  end

  post '/delete_bookmark' do
    Bookmark.delete(params[:delete])
    "Deleted #{params[:delete]} from bookmarks"
    redirect '/'
  end

  get '/bookmarks/delete' do
    @all_bookmarks = Bookmark.all
    erb :'/bookmarks/delete'
  end

  get '/bookmarks' do
    @all_bookmarks = Bookmark.all
    erb :bookmarks
  end

end
