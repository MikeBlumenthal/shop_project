require_relative('../db/sql_runner.rb')

class Distillery

  attr_reader( :id)
  attr_accessor( :name, :location, :established )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @location = options['location']
    @established = options['established'].to_i
  end

  def save()
    sql = "INSERT INTO distilleries
    ( name,
      location,
      established )
    VALUES
    ( $1, $2, $3 )
    RETURNING id"
    values = [ @name, @location, @established ]
    result = SqlRunner.run( sql, values )
    @id = result.first['id'].to_i
  end

  def update()
    sql = "UPDATE distilleries
    SET
    ( name,
      location,
      established
      ) =
      ( $1, $2, $3 )
      WHERE id = $4"
      values = [ @name, @location, @established, @id ]
      SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM distilleries
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def stock()
    sql ="SELECT * FROM stock WHERE distillery_id = $1"
    values = [@id]
    result = SqlRunner.run( sql, values)
    result.map { |stock_item| StockItem.new( stock_item ) }
  end

  def self.all()
    sql = "SELECT * FROM distilleries"
    distilleries = SqlRunner.run( sql )
    return distilleries.map { |distillery| Distillery.new( distillery ) }
  end

  def self.delete_all()
    sql = "DELETE FROM distilleries"
    SqlRunner.run( sql )
  end

end
