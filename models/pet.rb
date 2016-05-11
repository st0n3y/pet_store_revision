require( 'pg' )
require_relative( '../db/sql_runner.rb' )
require_relative( './pet_store.rb' )

class Pet

  attr_accessor :id, :name, :type, :image, :pet_store_id

  def initialize( params )
    @id = params[ 'id' ].to_i
    @name = params[ 'name' ]
    @type = params[ 'type' ]
    @image = params[ 'image' ]
    @pet_store_id = params[ 'pet_store_id' ].to_i
  end

  def save()
    sql = "INSERT INTO pets ( name, type, image, pet_store_id ) 
          VALUES ( '#{ @name }', '#{ @type }', '#{ image }', #{ pet_store_id } ) RETURNING *;"
    pet = SqlRunner.run( sql ).first
    result = Pet.new( pet )
    return result
  end


  def update()
    sql = "UPDATE pets
          SET name = #{ @name }, type = #{ @type }, image = #{ @image }, pet_store_id = #{ pet_store_id }
          WHERE id = #{ @id };"

    pet = SqlRunner.run( sql )
    result = Pet.new( pet )
    return result
  end


  def delete()
    sql = "DELETE FROM pets WHERE id = #{@id};"
  
  SqlRunner.run( sql )
  end


  def self.all()
    sql = "SELECT * FROM pets;"
    
    pets = SqlRunner.run( sql )
    return pets.map { |pet| Pet.new( pet ) }
  end

end