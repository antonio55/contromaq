require 'spec_helper'

describe "cadastros/organizacoes/edit" do
  before(:each) do
    @cadastros_organizacao = assign(:cadastros_organizacao, stub_model(Cadastros::Organizacao,
      :nome => "MyString",
      :razao_social => "MyString",
      :cnpj => "MyString",
      :telefone => "MyString",
      :pessoa_contato => "MyString",
      :string => "MyString",
      :email => "MyString",
      :endereco => "MyString"
    ))
  end

  it "renders the edit cadastros_organizacao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cadastros_organizacao_path(@cadastros_organizacao), "post" do
      assert_select "input#cadastros_organizacao_nome[name=?]", "cadastros_organizacao[nome]"
      assert_select "input#cadastros_organizacao_razao_social[name=?]", "cadastros_organizacao[razao_social]"
      assert_select "input#cadastros_organizacao_cnpj[name=?]", "cadastros_organizacao[cnpj]"
      assert_select "input#cadastros_organizacao_telefone[name=?]", "cadastros_organizacao[telefone]"
      assert_select "input#cadastros_organizacao_pessoa_contato[name=?]", "cadastros_organizacao[pessoa_contato]"
      assert_select "input#cadastros_organizacao_string[name=?]", "cadastros_organizacao[string]"
      assert_select "input#cadastros_organizacao_email[name=?]", "cadastros_organizacao[email]"
      assert_select "input#cadastros_organizacao_endereco[name=?]", "cadastros_organizacao[endereco]"
    end
  end
end
