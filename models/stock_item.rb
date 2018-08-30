require_relative('../db/sql_runner.rb')

class StockItem

  attr_reader( :id )
  attr_accessor( :name, :distillery_id, :supplier_id, :quantity, :style, :low_level, :cost_price, :sale_price )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @distillery_id = options['distillery_id'].to_i
    @supplier_id = options['supplier_id'].to_i
    @quantity = options['quantity'].to_i
    @style = options['style']
    @low_level = options['low_level'].to_i
    @cost_price = options['cost_price'].to_f.round(2)
    @sale_price = options['sale_price'].to_f.round(2)
    @level = self.level
  end

  def save()
    sql = "INSERT INTO stock
    ( name,
      distillery_id,
      supplier_id,
      quantity,
      style,
      low_level,
      cost_price,
      sale_price )
      VALUES
      ( $1, $2, $3, $4, $5, $6, $7, $8 )
      RETURNING id"
      values = [ @name, @distillery_id, @supplier_id, @quantity, @style, @low_level, @cost_price, @sale_price ]
      result = SqlRunner.run( sql, values )
      @id = result.first['id'].to_i
    end

    def update()
      sql = "UPDATE stock
      SET
      ( name,
        distillery_id,
        supplier_id,
        quantity,
        style,
        low_level,
        cost_price,
        sale_price
        ) =
        ( $1, $2, $3, $4, $5, $6, $7, $8 )
        WHERE id = $9"
        values = [ @name, @distillery_id, @supplier_id, @quantity, @style,
          @low_level, @cost_price, @sale_price, @id ]
          SqlRunner.run( sql, values )
        end

        def delete()
          sql = "DELETE FROM stock
          WHERE id = $1"
          values = [@id]
          SqlRunner.run( sql, values )
        end

        def high_stock()
          return @low_level*10
        end

        def level()
          if @quantity == 0
            return "NONE"
          elsif @quantity < @low_level
            return "LOW"
          elsif @quantity > self.high_stock
            return "HIGH"
          else
            return "JUST RIGHT"
          end
        end

        def distillery()
          sql = "SELECT * FROM distilleries
          WHERE id = $1"
          values = [@distillery_id]
          data = SqlRunner.run( sql, values )
          distillery = data.map { |distillery| Distillery.new( distillery ) }
          return distillery.first
        end

        def supplier()
          sql = "SELECT * FROM suppliers
          WHERE id = $1"
          values = [@supplier_id]
          result = SqlRunner.run( sql, values )
          supplier = result.map { |supplier| Supplier.new( supplier ) }
          return supplier.first
        end

        def profit()
          cost = @cost_price
          sale = @sale_price
          profit = sale - cost
          result = ( profit/sale )*100
          return result.round(1)
        end

        def self.all()
          sql = "SELECT * FROM stock"
          stock = SqlRunner.run( sql )
          return stock.map { |item| StockItem.new( item ) }
        end

        def self.all_distillery_ids()
          all_stock = self.all
          dist_array = []
          all_stock.each { |stock| dist_array << stock.distillery.id }
          dist_array = dist_array.uniq
          return dist_array
        end

        def self.all_supplier_ids()
          all_stock = self.all
          supplier_array = []
          all_stock.each { |stock| supplier_array << stock.supplier.id }
          supplier_array = supplier_array.uniq
          return supplier_array
        end

        def self.all_levels()
          all_stock = self.all
          stock_by_level = all_stock.sort_by {|stock| stock.level }
          return stock_by_level.reverse
        end

        def self.find(id)
          sql = "SELECT * FROM stock WHERE id = $1"
          values = [id]
          result = SqlRunner.run( sql, values)
          data = result.first
          return StockItem.new( data )
        end

        def self.delete_all()
          sql = "DELETE FROM stock"
          SqlRunner.run( sql )
        end

        def self.destroy(id)
          sql = "DELETE FROM stock
          WHERE id = $1"
          values = [id]
          SqlRunner.run( sql, values)
        end

      end
