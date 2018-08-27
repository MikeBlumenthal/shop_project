require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock_item')
require_relative('../models/supplier')
also_reload( '../models/*' )

get '/stock' do
  @stock = StockItem.all
  erb( :"stock/index" )
end
