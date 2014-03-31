class CreateAbastecimentos < ActiveRecord::Migration
  def change
    create_table :abastecimentos do |t|
      t.string :km
      t.string :tipo_combustivel
      t.string :quantidade
      t.string :valor
      t.string :data
      t.references :veiculo

      t.timestamps
    end
  end
end
