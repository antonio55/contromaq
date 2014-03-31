require 'spec_helper'

describe "cadastros/veiculos/edit" do
  before(:each) do
    @cadastros_veiculo = assign(:cadastros_veiculo, stub_model(Cadastros::Veiculo,
      :descricao => "MyString",
      :modelo => "MyString",
      :marca => "MyString",
      :placa => "MyString",
      :status => "MyString",
      :chassi => "MyString",
      :observacao => "MyString"
    ))
  end

  it "renders the edit cadastros_veiculo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cadastros_veiculo_path(@cadastros_veiculo), "post" do
      assert_select "input#cadastros_veiculo_descricao[name=?]", "cadastros_veiculo[descricao]"
      assert_select "input#cadastros_veiculo_modelo[name=?]", "cadastros_veiculo[modelo]"
      assert_select "input#cadastros_veiculo_marca[name=?]", "cadastros_veiculo[marca]"
      assert_select "input#cadastros_veiculo_placa[name=?]", "cadastros_veiculo[placa]"
      assert_select "input#cadastros_veiculo_status[name=?]", "cadastros_veiculo[status]"
      assert_select "input#cadastros_veiculo_chassi[name=?]", "cadastros_veiculo[chassi]"
      assert_select "input#cadastros_veiculo_observacao[name=?]", "cadastros_veiculo[observacao]"
    end
  end
end
