ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'bcrypt'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base
  enable :sessions
  include BCrypt

  helpers do
    def current_user
      User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/users/new'
  end

  get '/links' do
    @links = Link.all
    @email = current_user.email
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

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user_password = BCrypt::Password.create(params[:password])
    user = User.create(email: params[:email], password: user_password)

    session[:user_id] = user.id
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
