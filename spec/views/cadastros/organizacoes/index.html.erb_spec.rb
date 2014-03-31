require 'spec_helper'

describe "cadastros/organizacoes/index" do
  before(:each) do
    assign(:cadastros_organizacoes, [
      stub_model(Cadastros::Organizacao,
        :nome => "Nome",
        :razao_social => "Razao Social",
        :cnpj => "Cnpj",
        :telefone => "Telefone",
        :pessoa_contato => "Pessoa Contato",
        :string => "String",
        :email => "Email",
        :endereco => "Endereco"
      ),
      stub_model(Cadastros::Organizacao,
        :nome => "Nome",
        :razao_social => "Razao Social",
        :cnpj => "Cnpj",
        :telefone => "Telefone",
        :pessoa_contato => "Pessoa Contato",
        :string => "String",
        :email => "Email",
        :endereco => "Endereco"
      )
    ])
  end

  it "renders a list of cadastros/organizacoes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Razao Social".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Pessoa Contato".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
  end
end
