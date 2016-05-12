require_relative( './models/pet.rb' )
require_relative( './models/pet_store.rb' )

require( 'pry-byebug' )

pet_store1 = PetStore.new( { 'name' => 'Bark Side of the Moon', 'address' => '123 Fake Street', 'stock_type' => 'exotic' } ).save()

pet1 = Pet.new( { 'name' => 'Darth', 'type' => 'pygmy marmoset', 'image' => 'http://images.wisegeek.com/small-marmoset.jpg', 'pet_store_id' => pet_store1.id } ).save()

pet2 = Pet.new( { 'name' => 'Mammer Jammer', 'type' => 'pygmy marmoset', 'image' => 'http://images.wisegeek.com/small-marmoset.jpg', 'pet_store_id' => pet_store1.id } ).save()

binding.pry
nil