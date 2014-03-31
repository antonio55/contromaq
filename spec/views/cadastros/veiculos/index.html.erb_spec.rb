require 'spec_helper'

describe "cadastros/veiculos/index" do
  before(:each) do
    assign(:cadastros_veiculos, [
      stub_model(Cadastros::Veiculo,
        :descricao => "Descricao",
        :modelo => "Modelo",
        :marca => "Marca",
        :placa => "Placa",
        :status => "Status",
        :chassi => "Chassi",
        :observacao => "Observacao"
      ),
      stub_model(Cadastros::Veiculo,
        :descricao => "Descricao",
        :modelo => "Modelo",
        :marca => "Marca",
        :placa => "Placa",
        :status => "Status",
        :chassi => "Chassi",
        :observacao => "Observacao"
      )
    ])
  end

  it "renders a list of cadastros/veiculos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Descricao".to_s, :count => 2
    assert_select "tr>td", :text => "Modelo".to_s, :count => 2
    assert_select "tr>td", :text => "Marca".to_s, :count => 2
    assert_select "tr>td", :text => "Placa".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Chassi".to_s, :count => 2
    assert_select "tr>td", :text => "Observacao".to_s, :count => 2
  end
end
