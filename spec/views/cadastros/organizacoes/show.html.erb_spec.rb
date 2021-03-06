require 'spec_helper'

describe "cadastros/organizacoes/show" do
  before(:each) do
    @cadastros_organizacao = assign(:cadastros_organizacao, stub_model(Cadastros::Organizacao,
      :nome => "Nome",
      :razao_social => "Razao Social",
      :cnpj => "Cnpj",
      :telefone => "Telefone",
      :pessoa_contato => "Pessoa Contato",
      :string => "String",
      :email => "Email",
      :endereco => "Endereco"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Razao Social/)
    rendered.should match(/Cnpj/)
    rendered.should match(/Telefone/)
    rendered.should match(/Pessoa Contato/)
    rendered.should match(/String/)
    rendered.should match(/Email/)
    rendered.should match(/Endereco/)
  end
end
