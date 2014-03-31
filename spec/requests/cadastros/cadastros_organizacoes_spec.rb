require 'spec_helper'

describe "Cadastros::Organizacoes" do
  describe "GET /cadastros_organizacoes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get cadastros_organizacoes_path
      response.status.should be(200)
    end
  end
end
