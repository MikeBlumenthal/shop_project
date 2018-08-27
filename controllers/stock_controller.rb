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
