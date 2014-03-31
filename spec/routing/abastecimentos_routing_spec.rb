require "spec_helper"

describe AbastecimentosController do
  describe "routing" do

    it "routes to #index" do
      get("/abastecimentos").should route_to("abastecimentos#index")
    end

    it "routes to #new" do
      get("/abastecimentos/new").should route_to("abastecimentos#new")
    end

    it "routes to #show" do
      get("/abastecimentos/1").should route_to("abastecimentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/abastecimentos/1/edit").should route_to("abastecimentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/abastecimentos").should route_to("abastecimentos#create")
    end

    it "routes to #update" do
      put("/abastecimentos/1").should route_to("abastecimentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/abastecimentos/1").should route_to("abastecimentos#destroy", :id => "1")
    end

  end
end
