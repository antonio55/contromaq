require 'spec_helper'

describe "Cadastros::Veiculos" do
  describe "GET /cadastros_veiculos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cadastros_veiculos_path
      response.status.should be(200)
    end
  end
end
