class Bookmark < Sinatra::Base
  get '/links' do
    @links = Link.all
    erb :'links/index'
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

  get '/links/new' do
    erb :'links/new'
  end
end
