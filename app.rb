require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/stock_controller')
require_relative('controllers/suppliers_controller')
require_relative('controllers/distilleries_controller')

get '/' do
  erb ( :index )
end
