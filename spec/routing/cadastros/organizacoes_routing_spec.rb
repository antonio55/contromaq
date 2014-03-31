require "spec_helper"

describe Cadastros::OrganizacoesController do
  describe "routing" do

    it "routes to #index" do
      get("/cadastros/organizacoes").should route_to("cadastros/organizacoes#index")
    end

    it "routes to #new" do
      get("/cadastros/organizacoes/new").should route_to("cadastros/organizacoes#new")
    end

    it "routes to #show" do
      get("/cadastros/organizacoes/1").should route_to("cadastros/organizacoes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cadastros/organizacoes/1/edit").should route_to("cadastros/organizacoes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cadastros/organizacoes").should route_to("cadastros/organizacoes#create")
    end

    it "routes to #update" do
      put("/cadastros/organizacoes/1").should route_to("cadastros/organizacoes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cadastros/organizacoes/1").should route_to("cadastros/organizacoes#destroy", :id => "1")
    end

  end
end
