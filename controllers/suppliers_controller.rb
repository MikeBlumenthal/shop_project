require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock_item')
require_relative('../models/supplier')
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all
  erb( :"suppliers/index")
end
