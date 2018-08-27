require_relative('../db/sql_runner.rb')

class Supplier

  attr_reader( :id )
  attr_accessor( :name, :address, :telephone )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
    @telephone = options['telephone'].to_i
  end

  def save()
    sql = "INSERT INTO suppliers
    ( name,
      address,
      telephone )
    VALUES
    ( $1, $2, $3 )
    RETURNING id"
    values [ @name, @address, @telephone ]
    result = SqlRunner.run( sql, values )
    @id = result.first['id'].to_i
  end

  def all_stock()
    sql ="SELECT * FROM stock WHERE supplier_id = $1"
    values = [@id]
    result = SqlRunner.run( sql, values)
    return result.map { |stock_item| StockItem.new( stock_item ) }
  end


  def update()
    sql = "UPDATE suppliers
    SET (
      name,
      address,
      telephone
    ) =
    ( $1, $2, $3 )
    WHERE id = $4"
    values = [ @name, @address, @telephone, @id ]
    SqlRunner.run( sql, values )
  end

  def delete()
    sql = "DELETE FROM suppliers WHERE $1 = id"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.find_all()
    sql = "SELECT * FROM suppliers"
    suppliers = SqlRunner.run( sql )
    return suppliers.map { |supplier| Supplier.new(supplier) }
  end

  def self.delete_all()
    sql = "DELETE * FROM suppliers"
    SqlRunner.run( sql )
  end

end
