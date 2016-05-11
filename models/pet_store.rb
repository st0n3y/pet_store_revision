require( 'pg' )
require_relative( '../db/sql_runner.rb' )
require_relative( './pet.rb' )

class PetStore

  attr_accessor :id, :name, :address, :stock_type

  def initialize( params )
    @id = options[ 'id' ].to_i
    @name = options[ 'name' ]
    @address = options[ 'address' ]
    @stock_type = options[ 'stock_type' ]
  end


  def save()
    sql = "INSERT INTO pet_stores ( name, address, stock_type ) 
          VALUES ( '#{ @name }', #{ @address }, #{ stock_type } ) RETURNING *;"
    pet_store = SqlRunner.run( sql ).first
    result = PetStore.new( pet_store )
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
    sql = "DELETE FROM pet_stores WHERE id = #{@id};"

    db.exec( sql )
    db.close()
  end


  def self.all()
    db = PG.connect( { dbname: 'pet_store_chain', host: 'localhost' } )
    sql = "SELECT * FROM pet_stores;"
    
    pet_stores = db.exec( sql )
    db.close()
    return pet_stores.map { |pet_store| PetStore.new( pet_store ) }
  end

end