require 'spec_helper'

describe "abastecimentos/show" do
  before(:each) do
    @abastecimento = assign(:abastecimento, stub_model(Abastecimento,
      :km => "Km",
      :tipo_combustivel => "Tipo Combustivel",
      :quantidade => "Quantidade",
      :valor => "Valor",
      :data => "Data"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Km/)
    rendered.should match(/Tipo Combustivel/)
    rendered.should match(/Quantidade/)
    rendered.should match(/Valor/)
    rendered.should match(/Data/)
  end
end
