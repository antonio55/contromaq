class DeviseCreateUsuarios < ActiveRecord::Migration
  def change
    create_table(:usuarios) do |t|
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.string :login
      t.string :nome
      t.string :sexo
      t.enum :tipo
      t.references :usuario
      t.string :cpf
      t.string :nascimento
      t.string :telefone
      t.enum :situacao
      t.integer :qtd_usuarios
      t.integer :qtd_veiculos

      t.timestamps
    end

    add_index :usuarios, :email,                :unique => true
    add_index :usuarios, :reset_password_token, :unique => true
  end
end
