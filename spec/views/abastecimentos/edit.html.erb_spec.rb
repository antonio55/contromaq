require 'spec_helper'

describe "abastecimentos/edit" do
  before(:each) do
    @abastecimento = assign(:abastecimento, stub_model(Abastecimento,
      :km => "MyString",
      :tipo_combustivel => "MyString",
      :quantidade => "MyString",
      :valor => "MyString",
      :data => "MyString"
    ))
  end

  it "renders the edit abastecimento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", abastecimento_path(@abastecimento), "post" do
      assert_select "input#abastecimento_km[name=?]", "abastecimento[km]"
      assert_select "input#abastecimento_tipo_combustivel[name=?]", "abastecimento[tipo_combustivel]"
      assert_select "input#abastecimento_quantidade[name=?]", "abastecimento[quantidade]"
      assert_select "input#abastecimento_valor[name=?]", "abastecimento[valor]"
      assert_select "input#abastecimento_data[name=?]", "abastecimento[data]"
    end
  end
end
