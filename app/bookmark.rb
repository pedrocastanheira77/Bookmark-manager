ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tags_array = params[:tag].split(' ')
    if !tags_array.empty?
      tags_array.each do |tag|
        link.tags << Tag.first_or_create(name: tag.strip)
        link.save
      end
    else
      link.save
    end
    redirect '/links'
  end

  get '/tags/:name' do
    @tag = Tag.first(name: params[:name])
    @links = ( @tag ? @tag.links : [] )
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
