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
