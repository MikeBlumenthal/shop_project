require('pry-byebug')
require_relative('distillery.rb')
require_relative('supplier.rb')
require_relative('stock_item.rb')

StockItem.delete_all
Distillery.delete_all
Supplier.delete_all

distillery1 = Distillery.new(
  {
    'name' => 'Glenrothes',
    'location' => 'Speyside',
    'established' => '1878'
    }
  )

distillery1.save

supplier1 = Supplier.new(
  {
    'name' => 'Stewarts',
    'address' => '15 Maltings Drive, Grantown',
    'telephone' => '01244345678',
    'email' => 'stewartswhisky@yahoo.com'
  }
)

supplier1.save

stock1 = StockItem.new(
  {
    'name' => 'Select Reserve',
    'distillery_id' => distillery1.id,
    'supplier_id' => supplier1.id,
    'style' => 'light',
    'low_level' => '5',
    'high_level' => '50'
  }
)
stock2 = StockItem.new(
  {
    'name' => 'Vintage Reserve',
    'distillery_id' => distillery1.id,
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
