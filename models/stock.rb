require('pg')
require_relative('../db/sql_runner')
require_relative('album')

class Stock

  attr_reader(:id, :album_id, :stock_level, :stock_health, :buy_price, :sell_price)

  def initialize(options)
    @id = options['id'].to_i
    @album_id = options['album_id'].to_i
    @stock_level = options['stock_level'].to_i
    @stock_health = options['stock_health']
    @buy_price = options['buy_price'].to_i
    @sell_price = options['sell_price'].to_i
  end

  def self.all()
    sql = "SELECT * FROM stocks"
    stocks = SqlRunner.run(sql)
    result = stocks.map {|stock| Stock.new(stock)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM stocks WHERE id = #{id};"
    stock = SqlRunner.run(sql).first
    return Stock.new(stock)
  end

  def self.update(options)
    sql = "UPDATE stocks SET
          stock_level = '#{options['stock_level']}'
          WHERE id = #{options['id']}"
    return SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO stocks (album_id, stock_level, stock_health, buy_price, sell_price) VALUES 
    ( #{@album_id}, #{@stock_level}, '#{@stock_health}', #{@buy_price}, #{@sell_price}) RETURNING *"
    stock = SqlRunner.run(sql).first
    @id = stock['id']
  end

  def albums()
    sql = "SELECT * FROM albums WHERE album_id = #{@id}"
    albums = SqlRunner.run(sql)
    result = albums.map {|album| Album.new(album)}
    return result
  end

end