require "spec_helper"

describe OrganizacaosController do
  describe "routing" do

    it "routes to #index" do
      get("/organizacaos").should route_to("organizacaos#index")
    end

    it "routes to #new" do
      get("/organizacaos/new").should route_to("organizacaos#new")
    end

    it "routes to #show" do
      get("/organizacaos/1").should route_to("organizacaos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/organizacaos/1/edit").should route_to("organizacaos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/organizacaos").should route_to("organizacaos#create")
    end

    it "routes to #update" do
      put("/organizacaos/1").should route_to("organizacaos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/organizacaos/1").should route_to("organizacaos#destroy", :id => "1")
    end

  end
end
