class CreateClients < ActiveRecord::Migration[6.0]
  def change
  
  	create_table :Clients do |t|
  		t.text :name
  		t.text :phone
  		t.text :datestamp
  		t.text :barber
  		t.text :color

  		t.timestamps
  	end

  end
end
