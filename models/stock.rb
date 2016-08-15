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

  def self.update(options)
    sql = "UPDATE stocks SET
          stock_level = '#{options['stock_level']}'
          buy_price = options['buy_price']
          sell_price = options['sell_price']
          WHERE id = #{options['id']}"
    return SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO stocks (album_id, stock_level, stock_health, buy_price, sell_price) VALUES 
    ( #{@album_id}, #{@stock_level}, '#{@stock_health}', #{@buy_price}, #{@sell_price}) RETURNING *"
    stock = SqlRunner.run(sql).first
    @id = stock['id']
  end

  def album()
    sql = "SELECT * FROM albums where id = #{@album_id}"
    album = SqlRunner.run(sql).first
    result = Album.new(album)
    return result
  end

end