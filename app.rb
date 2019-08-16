
require 'sinatra/base'
require 'sinatra'
require 'sinatra/flash'
require './lib/bookmark'
require './lib/connection_helper.rb'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @all_bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    @all_bookmarks = Bookmark.all
    erb :'/bookmarks/new'
  end

  post '/add_bookmark' do
    if params['url'] =~ /\A#{URI.regexp(%w[http https])}\z/
      Bookmark.add(title: params[:title], url: params[:url])
    else
      flash[:notice] = 'You must submit a VALID url'
    end
    redirect '/'
  end

  post '/delete_bookmark' do
    Bookmark.delete(params[:delete])
    "Deleted #{params[:delete]} from bookmarks"
    redirect '/'
  end

  post '/update_url' do
    if params['update_url'] =~ /\A#{URI.regexp(%w[http https])}\z/
      Bookmark.update_url(params[:title1], params[:update_url])    else
      flash[:notice] = 'You must submit a VALID url'
    end
    redirect '/'
  end

  post '/update_title' do
    Bookmark.update_title(params[:title2], params[:new_title])
    "update #{params[:title2]} url to #{params[:new_title]}"
    redirect '/'
  end

  get '/bookmarks/update' do
    @all_bookmarks = Bookmark.all
    erb :'/bookmarks/update'
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
