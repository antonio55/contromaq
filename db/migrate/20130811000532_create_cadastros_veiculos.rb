class CreateCadastrosVeiculos < ActiveRecord::Migration
  def change
    create_table :cadastros_veiculos do |t|
      t.string :tag
      t.string :placa
      t.string :ano
      t.string :tipo
      t.string :marca
      t.string :modelo
      t.string :chassi
      t.string :status
      t.string :nota_fiscal
      t.string :tombamento
      t.string :tipo_motor
      t.text :observacao
      t.references :usuario

      t.timestamps
    end
  end
end
