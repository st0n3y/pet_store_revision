class SqlRunner

  def self.run( sql ) 
    begin 
      db = PG.connect( { dbname: 'pet_store_chain', host: 'localhost' } )
      result = db.exec( sql )
    ensure #Failsafe. Will run even if begin code errors out.
      db.close
    end
    return result
  end

end