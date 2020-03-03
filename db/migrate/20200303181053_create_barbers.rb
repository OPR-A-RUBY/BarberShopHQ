class CreateBarbers < ActiveRecord::Migration[6.0]
  def change

  	create_table :Barbers do |t|
  		t.text :name

  		t.timestamps
  	end

  	Barber.create :name => 'Jessie Pincman'
  	Barber.create :name => 'Walter Whait'
  	Barber.create :name => 'Gas Fring'


  end
end
