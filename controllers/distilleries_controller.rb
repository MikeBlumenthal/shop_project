require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock_item')
require_relative('../models/supplier')
require_relative('../models/distillery')
also_reload( '../models/*' )

get '/distilleries' do
  @distilleries = Distillery.all
  erb( :"distilleries/index")
end

get '/distilleries/new' do
  erb( :"distilleries/new" )
end

post '/distilleries' do
  Distillery.new(params).save
  redirect to '/distilleries'
end

get '/distilleries/:id/warning' do
  @distillery = Distillery.find(params[:id])
  erb( :"distilleries/warning" )
end

get '/distilleries/:id/edit' do
  @distillery = Distillery.find(params[:id])
  erb( :"distilleries/edit")
end

post '/distilleries/:id' do
  Distillery.new(params).update
  redirect to '/distilleries'
end

post '/distilleries/:id/delete' do
  Distillery.destroy(params[:id])
  redirect to '/distilleries'
end
