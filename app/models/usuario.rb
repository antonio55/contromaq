# encoding: utf-8

class Usuario < ActiveRecord::Base

require "#{Rails.root}/lib/validadores/email_validator"
require "#{Rails.root}/lib/validadores/cpf_validator"

  has_many :dependentes, class_name: 'Usuario'
  has_many :veiculos, class_name: 'Cadastros::Veiculo'

  validates :cpf, cpf: true
  validates :email, email: true

  def active_for_authentication?
    self.situacao_is_ativo?
  end

  has_paper_trail

  devise :database_authenticatable, :registerable,
              :recoverable, :rememberable, :trackable, :validatable,
              :timeoutable


  validates_uniqueness_of :login, :cpf
  validates_length_of :login, within: 5..10

  validates_presence_of :login, :nome, :sexo, :situacao, :tipo,
 						:cpf, :nascimento, :telefone

  validates_confirmation_of :password, if: ->(s) { s.password_required? }
  validates_length_of :password, within: 6..20, if: lambda { |s| s.password_required? }
  validates_presence_of :password, if: lambda { |s| s.password_required? }

  attr_accessible :email, :password, :password_confirmation, :remember_me,
  				  :nome, :login, :sexo, :situacao, :tipo, :estabelecimento_id, 
  				  :situacao, :cpf, :nascimento, :telefone, :usuario_id, :qtd_usuarios, :qtd_veiculos

enum_attr :sexo, %w(masculino feminino)
enum_attr :situacao, %w(^ativo inativo)

enum_attr :tipo, %w(usuario administrador organizacao) do
  label organizacao: "organização"
  label usuario: "usuário"
end
  								
protected

  def password_required?
    !self.persisted? || self.password.present? || self.password_confirmation.present?
  end
end