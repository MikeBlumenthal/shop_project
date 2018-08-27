require('pry-byebug')
require_relative('supplier.rb')
require_relative('stock_item.rb')

StockItem.delete_all
Supplier.delete_all

supplier1 = Supplier.new(
  {
    'name' => 'Stewarts',
    'address' => '15 Maltings Drive, Grantown',
    'telephone' => '01244345678'
  }
)

supplier1.save

stock1 = StockItem.new(
  {
    'name' => 'Glenrothes Select Reserve',
    'supplier_id' => supplier1.id,
    'style' => 'light',
    'low_level' => '5',
    'high_level' => '50'
  }
)
stock2 = StockItem.new(
  {
    'name' => 'Glenrothes Vintage Reserve',
    'supplier_id' => supplier1.id,
    'quantity' => '10',
    'style' => 'rich',
    'low_level' => '3',
    'high_level' => '30'
  }
)
stock1.save
stock2.save



binding.pry
nil
