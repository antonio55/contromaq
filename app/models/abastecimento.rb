class Abastecimento < ActiveRecord::Base
  attr_accessible :data, :km, :quantidade, :tipo_combustivel, :valor, :veiculo_id

  has_paper_trail

  belongs_to :veiculo, class_name: "Cadastros::Veiculo"

  enum_attr :tipo_combustivel, %w(gasolina alcool diesel flex)


  validates_presence_of :veiculo_id, :valor, :tipo_combustivel, :quantidade, :km, :data
end
