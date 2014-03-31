require 'spec_helper'

describe "abastecimentos/index" do
  before(:each) do
    assign(:abastecimentos, [
      stub_model(Abastecimento,
        :km => "Km",
        :tipo_combustivel => "Tipo Combustivel",
        :quantidade => "Quantidade",
        :valor => "Valor",
        :data => "Data"
      ),
      stub_model(Abastecimento,
        :km => "Km",
        :tipo_combustivel => "Tipo Combustivel",
        :quantidade => "Quantidade",
        :valor => "Valor",
        :data => "Data"
      )
    ])
  end

  it "renders a list of abastecimentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Km".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo Combustivel".to_s, :count => 2
    assert_select "tr>td", :text => "Quantidade".to_s, :count => 2
    assert_select "tr>td", :text => "Valor".to_s, :count => 2
    assert_select "tr>td", :text => "Data".to_s, :count => 2
  end
end
