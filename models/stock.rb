require('pg')
require_relative('../db/sql_runner')
require_relative('album')
require_relative('artist')

class Stock

  attr_reader(:id, :album_id, :stock_level, :buy_price, :sell_price)

  def initialize(options)
    @id = options['id'].to_i
    @album_id = options['album_id'].to_i
    @stock_level = options['stock_level'].to_i
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

  def self.destroy(id)
    sql = "DELETE FROM stocks WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO stocks (album_id, stock_level, buy_price, sell_price) VALUES 
    ( #{@album_id}, #{@stock_level}, #{@buy_price}, #{@sell_price}) RETURNING *"
    stock = SqlRunner.run(sql).first
    @id = stock['id']
  end

  def albums()
    sql = "SELECT * FROM albums WHERE id = #{@id}"
    albums = SqlRunner.run(sql)
    result = albums.map {|album| Album.new(album)}
    return result
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = #{@album_id}"
    albums = SqlRunner.run(sql)
    result = artists.map {|artist| Artist.new(artist)}
    return result
  end

  def stock_check()
    if @stock_level >= 10
      return "High"
    elsif @stock_level >= 4
      return "Medium"
    elsif @stock_level <= 3
      return "Low - Please re-order ASAP"
    end
  end

end