ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Bookmark < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
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
    @user = User.new(
              email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      @email = @user.email
      @user.errors.full_messages
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
