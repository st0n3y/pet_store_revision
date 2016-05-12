require( 'pg' )
require_relative( '../db/sql_runner.rb' )
require_relative( './pet.rb' )

class PetStore

  attr_accessor :id, :name, :address, :stock_type

  def initialize( params )
    @id = params[ 'id' ].to_i
    @name = params[ 'name' ]
    @address = params[ 'address' ]
    @stock_type = params[ 'stock_type' ]
  end


  def save()
    sql = "INSERT INTO pet_stores ( name, address, stock_type ) 
          VALUES ( '#{ @name }', '#{ @address }', '#{ stock_type }' ) RETURNING *;"
    pet_store = SqlRunner.run( sql ).first
    result = PetStore.new( pet_store )
    return result
  end


  def update()
      sql = "UPDATE pets
            SET name = '#{ @name }', 
            type = '#{ @type }', 
            image = '#{ @image }', 
            pet_store_id = #{ pet_store_id }
            WHERE id = #{ @id };"

      pet_store = SqlRunner.run( sql )
      result = PetStore.new( pet_store )
      return result
  end


  def delete()
    sql = "DELETE FROM pet_stores WHERE id = #{@id};"

    SqlRunner.run( sql )
  end


  def self.all()
    sql = "SELECT * FROM pet_stores;"
    
    pet_stores = SqlRunner.run( sql )
    return pet_stores.map { |pet_store| PetStore.new( pet_store ) }
  end


  def pets()
    sql = "SELECT * FROM pets 
          WHERE pet_store_id = #{ @id };"
    pets = SqlRunner.run( sql )
    result = Pet.new( pets )
    return result
  end

end