require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock_item')
require_relative('../models/supplier')
require_relative('../models/distillery')
also_reload( '../models/*' )

get '/stock' do
  @stock = StockItem.all
  erb( :"stock/index" )
end

get '/stock/new' do
  erb( :"stock/new" )
end

post '/stock' do
  StockItem.new(params).save
  redirect to '/stock'
end

get '/stock/:id/edit' do
  @stock_item = StockItem.find(params[:id])
  erb( :"stock/edit")
end

post '/stock/:id' do
  StockItem.new(params).update
  redirect to '/stock'
end

post '/stock/:id/delete' do
  StockItem.destroy(params[:id])
  redirect to '/stock'
end
