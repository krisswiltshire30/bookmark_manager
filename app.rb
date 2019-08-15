# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    @all_bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    @all_bookmarks = Bookmark.all
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

  post '/update_url' do
    Bookmark.update_url(params[:title1], params[:update_url])
    "update #{params[:title1]} url to #{params[:update_url]}"
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
