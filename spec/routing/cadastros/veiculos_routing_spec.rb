require "spec_helper"

describe Cadastros::VeiculosController do
  describe "routing" do

    it "routes to #index" do
      get("/cadastros/veiculos").should route_to("cadastros/veiculos#index")
    end

    it "routes to #new" do
      get("/cadastros/veiculos/new").should route_to("cadastros/veiculos#new")
    end

    it "routes to #show" do
      get("/cadastros/veiculos/1").should route_to("cadastros/veiculos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cadastros/veiculos/1/edit").should route_to("cadastros/veiculos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cadastros/veiculos").should route_to("cadastros/veiculos#create")
    end

    it "routes to #update" do
      put("/cadastros/veiculos/1").should route_to("cadastros/veiculos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cadastros/veiculos/1").should route_to("cadastros/veiculos#destroy", :id => "1")
    end

  end
end
