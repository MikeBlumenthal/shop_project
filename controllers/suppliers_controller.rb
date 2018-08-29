require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/stock_item')
require_relative('../models/supplier')
require_relative('../models/distillery')
also_reload( '../models/*' )

get '/suppliers' do
  @suppliers = Supplier.all
  erb( :"suppliers/index")
end

get '/suppliers/new' do
  erb( :"suppliers/new")
end

post '/suppliers' do
  Supplier.new(params).save
  redirect to '/suppliers'
end

get '/suppliers/:id/warning' do
  @supplier = Supplier.find(params[:id])
  erb( :"suppliers/warning" )
end

get '/suppliers/:id/edit' do
  @supplier = Supplier.find(params[:id])
  erb( :"suppliers/edit")
end

post '/suppliers/:id' do
  Supplier.new(params).update
  redirect to '/suppliers'
end

post '/suppliers/:id/delete' do
  Supplier.destroy(params[:id])
  redirect to '/suppliers'
end
