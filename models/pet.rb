require( 'pg' )
require_relative( '../db/sql_runner.rb' )
require_relative( './pet_store.rb' )

class Pet

  attr_accessor :id, :name, :type, :image, :pet_store_id

  def initialize( params )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @type = options[ 'type' ]
    @image = options[ 'image' ]
    @pet_store_id = options[ 'pet_store_id' ].to_i
  end

  def save()
    sql = "INSERT INTO pets ( name, type, image, pet_store_id ) 
          VALUES ( '#{ @name }', #{ @type }, #{ image }, #{ pet_store_id } ) RETURNING *;"
    pet = SqlRunner.run( sql ).first
    result = Pet.new( pet )
    return result
  end


  def update()
    sql = "UPDATE pets
          SET name = #{ @name }, type = #{ @type }, image = #{ @image }, pet_store_id = #{ pet_store_id }
          WHERE id = #{ @id };"

    db.exec( sql )
    db.close()
  end


  def delete()
    sql = "DELETE FROM pets WHERE id = #{@id};"

    db.exec( sql )
    db.close()
  end


  def self.all()
    db = PG.connect( { dbname: 'pet_store_chain', host: 'localhost' } )
    sql = "SELECT * FROM pets;"
    
    pets = db.exec( sql )
    db.close()
    return pets.map { |pet| Pet.new( pet ) }
  end

end