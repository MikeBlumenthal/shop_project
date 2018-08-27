require_relative('../db/sql_runner.rb')

class StockItem

  attr_reader( :id )
  attr_accessor( :name, :supplier_id, :quantity, )

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @supplier_id = options['supplier_id'].to_i
    @quantity = options['quantity'].to_i || 0
    @style = options['style']
    @low_level = options['low_level'].to_i
    @high_level = options['high_level'].to_i
  end

  def
end
