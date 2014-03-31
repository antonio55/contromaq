require 'spec_helper'

describe "abastecimentos/new" do
  before(:each) do
    assign(:abastecimento, stub_model(Abastecimento,
      :km => "MyString",
      :tipo_combustivel => "MyString",
      :quantidade => "MyString",
      :valor => "MyString",
      :data => "MyString"
    ).as_new_record)
  end

  it "renders new abastecimento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", abastecimentos_path, "post" do
      assert_select "input#abastecimento_km[name=?]", "abastecimento[km]"
      assert_select "input#abastecimento_tipo_combustivel[name=?]", "abastecimento[tipo_combustivel]"
      assert_select "input#abastecimento_quantidade[name=?]", "abastecimento[quantidade]"
      assert_select "input#abastecimento_valor[name=?]", "abastecimento[valor]"
      assert_select "input#abastecimento_data[name=?]", "abastecimento[data]"
    end
  end
end
