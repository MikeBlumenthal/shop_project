require_relative('../models/distillery.rb')
require_relative('../models/supplier.rb')
require_relative('../models/stock_item.rb')

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
    'name' => 'Arran',
    'location' => 'Islands',
    'established' => '1995'
  }
)
distillery3 = Distillery.new(
  {
    'name' => 'Highland Park',
    'location' => 'Islands',
    'established' => '1798'
  }
)
distillery4 = Distillery.new(
  {
    'name' => 'Auchentoshan',
    'location' => 'Lowlands',
    'established' => '1823'
  }
)
distillery5 = Distillery.new(
  {
    'name' => 'Caol Ila',
    'location' => 'Islay',
    'established' => '1846'
  }
)
distillery6 = Distillery.new(
  {
    'name' => 'Clynelish',
    'location' => 'Highlands',
    'established' => '1819'
  }
)

distillery1.save
distillery2.save
distillery3.save
distillery4.save
distillery5.save
distillery6.save

supplier1 = Supplier.new(
  {
    'name' => 'Berry Bros & Rudd',
    'address' => '15 Maltings Drive',
    'telephone' => '01244 345678',
    'email' => 'stewart@berrybros.co.uk'
  }
)
supplier2 = Supplier.new(
  {
    'name' => 'Gordon & MacPhail',
    'address' => 'George House, Elgin',
    'telephone' => '01343 554801',
    'email' => 'orders@gandm.co.uk'
  }
)
supplier3 = Supplier.new(
  {
    'name' => 'Persephone Spirits',
    'address' => '144 Causewayside',
    'telephone' => '0131 121333',
    'email' => 'sophie@persephone.com'
  }
)
supplier1.save
supplier2.save
supplier3.save

stock1 = StockItem.new(
  {
    'name' => 'Select Reserve',
    'distillery_id' => distillery1.id,
    'supplier_id' => supplier1.id,
    'quantity' => '60',
    'style' => 'light',
    'low_level' => '8',
    'cost_price' => '17.85',
    'sale_price' => '26.99'
  }
)
stock2 = StockItem.new(
  {
    'name' => 'Vintage Reserve',
    'distillery_id' => distillery1.id,
    'supplier_id' => supplier1.id,
    'quantity' => '43',
    'style' => 'rich',
    'low_level' => '5',
    'cost_price' => '23.45',
    'sale_price' => '32.99'
  }
)
stock3 = StockItem.new(
  {
    'name' => 'Amarone Cask Finish',
    'distillery_id' => distillery2.id,
    'supplier_id' => supplier1.id,
    'quantity' => '3',
    'style' => 'fruity',
    'low_level' => '6',
    'cost_price' => '35.04',
    'sale_price' => '44.99'
  }
)
stock4 = StockItem.new(
  {
    'name' => 'Madeira Cask Finish',
    'distillery_id' => distillery2.id,
    'supplier_id' => supplier1.id,
    'quantity' => '0',
    'style' => 'fruity',
    'low_level' => '6',
    'cost_price' => '32.15',
    'sale_price' => '44.99'
  }
)
stock5 = StockItem.new(
  {
    'name' => 'DB 14 Year Old ',
    'distillery_id' => distillery2.id,
    'supplier_id' => supplier2.id,
    'quantity' => '15',
    'style' => 'rich',
    'low_level' => '5',
    'cost_price' => '35.50',
    'sale_price' => '45.00'
  }
)
stock6 = StockItem.new(
  {
    'name' => 'Cadenheads 10 Year Old',
    'distillery_id' => distillery3.id,
    'supplier_id' => supplier3.id,
    'quantity' => '13',
    'style' => 'smoky',
    'low_level' => '1',
    'cost_price' => '32.46',
    'sale_price' => '50'
  }
)
stock7 = StockItem.new(
  {
    'name' => 'Three Wood',
    'distillery_id' => distillery4.id,
    'supplier_id' => supplier1.id,
    'quantity' => '120',
    'style' => 'light',
    'low_level' => '10',
    'cost_price' => '13.89',
    'sale_price' => '19.99'
  }
)
stock8 = StockItem.new(
  {
    'name' => 'DB 12 Year Old',
    'distillery_id' => distillery5.id,
    'supplier_id' => supplier2.id,
    'quantity' => '4',
    'style' => 'smoky',
    'low_level' => '5',
    'cost_price' => '18.5',
    'sale_price' => '24.99'
  }
)
stock9 = StockItem.new(
  {
    'name' => 'G&M 18 Year Old',
    'distillery_id' => distillery6.id,
    'supplier_id' => supplier2.id,
    'quantity' => '5',
    'style' => 'rich',
    'low_level' => '1',
    'cost_price' => '79',
    'sale_price' => '105.30'
  }
)
stock10 = StockItem.new(
  {
    'name' => 'G&M Teaspoon Special',
    'distillery_id' => distillery4.id,
    'supplier_id' => supplier2.id,
    'quantity' => '3',
    'style' => 'fruity',
    'low_level' => '10',
    'cost_price' => '7.45',
    'sale_price' => '12.00'
  }
)
stock1.save
stock2.save
stock3.save
stock4.save
stock5.save
stock6.save
stock7.save
stock8.save
stock9.save
stock10.save
