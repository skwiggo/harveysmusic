require( 'pg' )
require_relative('../db/sql_runner')
require_relative('../models/artist')

class Album

  attr_accessor( :id, :name, :artist_id)

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @artist_id = options['artist_id']
  end

  def self.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    result = albums.map {|album| Album.new(album)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id};"
    album = SqlRunner.run(sql).first
    return Album.new(album)
  end

  def self.update(options)
    sql = "UPDATE albums SET
          name = '#{options['name']}'
          WHERE id = #{options['id']}"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM albums WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', #{@artist_id}) RETURNING *"
    album = SqlRunner.run(sql).first
    @id = album['id']
  end               
  
  def artists()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    artists = SqlRunner.run(sql)
    result = artists.map {|artist| Artist.new(artist)}
    return result
  end

end
