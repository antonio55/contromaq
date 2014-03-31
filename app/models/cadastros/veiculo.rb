# encoding: utf-8

class Cadastros::Veiculo < ActiveRecord::Base
  attr_accessible :chassi, :tipo, :marca, :modelo, :observacao, 
  :placa, :status, :tag, :oleo_limite, :tipo, :usuario_id, :ano, :nota_fiscal,
  :tombamento, :tipo_motor

  scope :ativo, where("status = 'ativo'")


  has_one :estabelecimento, class_name: 'Ususario'
  has_many :abastecimentos, class_name: 'Abastecimento'

  validates_presence_of :chassi, :tipo, :marca, :modelo, :status, :tag, :ano, :nota_fiscal
  validates_presence_of :placa, if: ->(v) { v.tipo? and v.tipo_was_not_equipamento? }

  enum_attr :tipo, %w(moto carro caminhao carreta equipamento) do
  	label caminhao: "caminhão"
  end
  enum_attr :status, %w(ativo inativo)

  belongs_to :estabelecimento

  has_paper_trail

end
