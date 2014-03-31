require 'spec_helper'

describe "organizacaos/edit" do
  before(:each) do
    @organizacao = assign(:organizacao, stub_model(Organizacao,
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

  it "renders the edit organizacao form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", organizacao_path(@organizacao), "post" do
      assert_select "input#organizacao_nome[name=?]", "organizacao[nome]"
      assert_select "input#organizacao_razao_social[name=?]", "organizacao[razao_social]"
      assert_select "input#organizacao_cnpj[name=?]", "organizacao[cnpj]"
      assert_select "input#organizacao_telefone[name=?]", "organizacao[telefone]"
      assert_select "input#organizacao_pessoa_contato[name=?]", "organizacao[pessoa_contato]"
      assert_select "input#organizacao_string[name=?]", "organizacao[string]"
      assert_select "input#organizacao_email[name=?]", "organizacao[email]"
      assert_select "input#organizacao_endereco[name=?]", "organizacao[endereco]"
    end
  end
end
