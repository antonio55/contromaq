class CreateTrocaOleos < ActiveRecord::Migration
  def change
    create_table :troca_oleos do |t|
    	t.references :veiculo
    	t.string :km
    	t.string 
      t.timestamps
    end
  end
end
