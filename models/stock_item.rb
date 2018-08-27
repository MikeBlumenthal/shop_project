require_relative('../db/sql_runner.rb')

class StockItem

  attr_reader( :id )
  attr_accessor( :name, :supplier_id, :quantity, :style, :low_level, :high_level )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @supplier_id = options['supplier_id'].to_i
    @quantity = options['quantity'].to_i || 0
    @style = options['style']
    @low_level = options['low_level'].to_i
    @high_level = options['high_level'].to_i
  end

  def save()
    sql = "INSERT INTO stock
    ( name,
      supplier_id,
      quantity,
      style,
      low_level,
      high_level
    )
    VALUES
    ( $1, $2, $3, $4, $5, $6 )
    RETURNING id"
    values = [ @name, @supplier_id, @quantity, @style, @low_level, @high_level ]
    result = SqlRunner.run( sql, values )
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE stock
    SET (
      name, supplier_id, quantity, style, low_level, high_level
      ) =
      ( $1, $2, $3, $4, $5, $6 )
      WHERE id = $7"
    values = [ @name, @supplier_id, @quantity, @style,
        @low_level, @high_level, @id ]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM stock
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find_all()
    sql = "SELECT * FROM stock"
    stock = SqlRunner.run( sql )
    return stock.map { |item| StockItem.new( item ) }
  end

  def self.delete_all()
    sql = "DELETE FROM stock"
    SqlRunner.run( sql )
  end

  def level()
    if @quantity == 0
      return "NONE"
    elsif @quantity < @low_level
      return "LOW"
    elsif @quantity > @high_level
      return "HIGH"
    else
      return "OK"
    end
  end

end
