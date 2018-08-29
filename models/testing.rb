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

distillery2 = Distillery.new(
  {
    'name' => 'Highland Park',
    'location' => 'Islands',
    'established' => '1798'
    }
  )

distillery3 = Distillery.new(
  {
    'name' => 'Glenlivet',
    'location' => 'Speyside',
    'established' => '1824'
    }
  )

distillery1.save
distillery2.save
distillery3.save

supplier1 = Supplier.new(
  {
    'name' => 'Stewarts',
    'address' => '15 Maltings Drive',
    'telephone' => '01244345678',
    'email' => 'stewartswhisky@yahoo.com'
  }
)
supplier2 = Supplier.new(
  {
    'name' => 'Persephone Spirits',
    'address' => '144 Causewayside',
    'telephone' => '0131 333 9236',
    'email' => 'steph@ps.info'
  }
)
supplier1.save
supplier2.save

stock1 = StockItem.new(
  {
    'name' => 'Select Reserve',
    'distillery_id' => distillery1.id,
    'supplier_id' => supplier1.id,
    'style' => 'light',
    'low_level' => '5',
    'cost_price' => '20',
    'sale_price' => '34.99'
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
    'cost_price' => '25.70',
    'sale_price' => '47.50'
  }
)
stock3 = StockItem.new(
  {
    'name' => '12 year old DB',
    'distillery_id' => distillery2.id,
    'supplier_id' => supplier2.id,
    'quantity' => '60',
    'style' => 'smoky',
    'low_level' => '5',
    'cost_price' => '15.00',
    'sale_price' => '30'
  }
)
stock1.save
stock2.save
stock3.save



binding.pry
nil
