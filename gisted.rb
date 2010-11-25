require 'rubygems'
require 'sinatra'
require 'haml'
require 'open-uri'
require 'json'

get '/' do
  haml :index
end

post '/' do
  redirect "/#{params[:gist_id]}/"
end

get '/:gist_id/' do
  response = JSON.parse open("http://gist.github.com/api/v1/json/#{params[:gist_id]}").read
  data = response['gists'][0]
  haml :gist, :locals => {
    :gist_id => params[:gist_id],
    :description => data['description'],
    :files => data['files']
  }
end

get '/:gist_id/:file' do
  open "https://gist.github.com/raw/#{params[:gist_id]}/#{params[:file]}"
end

enable :inline_templates

__END__

@@ index
%h1 Gists View
%p Made to view HTML files on <a href="http://gist.github.com">gist</a> as HTML pages
%p Input gist id to get its content (for example 714121)
%form{:method => :post}
  %input{:type => :text, :name => :gist_id}
  %input{:type => :submit}

@@ gist
%h1
  Gist
  %a{:href => "http://gist.github.com/#{gist_id}"}= gist_id
  files
%ul
  - files.each do |file|
    %li
      %a{:href => file}= file
