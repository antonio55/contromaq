require 'spec_helper'

describe "cadastros/veiculos/show" do
  before(:each) do
    @cadastros_veiculo = assign(:cadastros_veiculo, stub_model(Cadastros::Veiculo,
      :descricao => "Descricao",
      :modelo => "Modelo",
      :marca => "Marca",
      :placa => "Placa",
      :status => "Status",
      :chassi => "Chassi",
      :observacao => "Observacao"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Descricao/)
    rendered.should match(/Modelo/)
    rendered.should match(/Marca/)
    rendered.should match(/Placa/)
    rendered.should match(/Status/)
    rendered.should match(/Chassi/)
    rendered.should match(/Observacao/)
  end
end
