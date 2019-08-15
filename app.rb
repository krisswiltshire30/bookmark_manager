
require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks/new' do
    erb :'/bookmarks/new'
  end

  post '/input' do
    Bookmark.add(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @all_bookmarks = Bookmark.all
    erb :bookmarks
  end
end
