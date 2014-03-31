require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe Cadastros::VeiculosController do

  # This should return the minimal set of attributes required to create a valid
  # Cadastros::Veiculo. As you add validations to Cadastros::Veiculo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "descricao" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Cadastros::VeiculosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all cadastros_veiculos as @cadastros_veiculos" do
      veiculo = Cadastros::Veiculo.create! valid_attributes
      get :index, {}, valid_session
      assigns(:cadastros_veiculos).should eq([veiculo])
    end
  end

  describe "GET show" do
    it "assigns the requested cadastros_veiculo as @cadastros_veiculo" do
      veiculo = Cadastros::Veiculo.create! valid_attributes
      get :show, {:id => veiculo.to_param}, valid_session
      assigns(:cadastros_veiculo).should eq(veiculo)
    end
  end

  describe "GET new" do
    it "assigns a new cadastros_veiculo as @cadastros_veiculo" do
      get :new, {}, valid_session
      assigns(:cadastros_veiculo).should be_a_new(Cadastros::Veiculo)
    end
  end

  describe "GET edit" do
    it "assigns the requested cadastros_veiculo as @cadastros_veiculo" do
      veiculo = Cadastros::Veiculo.create! valid_attributes
      get :edit, {:id => veiculo.to_param}, valid_session
      assigns(:cadastros_veiculo).should eq(veiculo)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cadastros::Veiculo" do
        expect {
          post :create, {:cadastros_veiculo => valid_attributes}, valid_session
        }.to change(Cadastros::Veiculo, :count).by(1)
      end

      it "assigns a newly created cadastros_veiculo as @cadastros_veiculo" do
        post :create, {:cadastros_veiculo => valid_attributes}, valid_session
        assigns(:cadastros_veiculo).should be_a(Cadastros::Veiculo)
        assigns(:cadastros_veiculo).should be_persisted
      end

      it "redirects to the created cadastros_veiculo" do
        post :create, {:cadastros_veiculo => valid_attributes}, valid_session
        response.should redirect_to(Cadastros::Veiculo.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cadastros_veiculo as @cadastros_veiculo" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cadastros::Veiculo.any_instance.stub(:save).and_return(false)
        post :create, {:cadastros_veiculo => { "descricao" => "invalid value" }}, valid_session
        assigns(:cadastros_veiculo).should be_a_new(Cadastros::Veiculo)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cadastros::Veiculo.any_instance.stub(:save).and_return(false)
        post :create, {:cadastros_veiculo => { "descricao" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cadastros_veiculo" do
        veiculo = Cadastros::Veiculo.create! valid_attributes
        # Assuming there are no other cadastros_veiculos in the database, this
        # specifies that the Cadastros::Veiculo created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Cadastros::Veiculo.any_instance.should_receive(:update_attributes).with({ "descricao" => "MyString" })
        put :update, {:id => veiculo.to_param, :cadastros_veiculo => { "descricao" => "MyString" }}, valid_session
      end

      it "assigns the requested cadastros_veiculo as @cadastros_veiculo" do
        veiculo = Cadastros::Veiculo.create! valid_attributes
        put :update, {:id => veiculo.to_param, :cadastros_veiculo => valid_attributes}, valid_session
        assigns(:cadastros_veiculo).should eq(veiculo)
      end

      it "redirects to the cadastros_veiculo" do
        veiculo = Cadastros::Veiculo.create! valid_attributes
        put :update, {:id => veiculo.to_param, :cadastros_veiculo => valid_attributes}, valid_session
        response.should redirect_to(veiculo)
      end
    end

    describe "with invalid params" do
      it "assigns the cadastros_veiculo as @cadastros_veiculo" do
        veiculo = Cadastros::Veiculo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cadastros::Veiculo.any_instance.stub(:save).and_return(false)
        put :update, {:id => veiculo.to_param, :cadastros_veiculo => { "descricao" => "invalid value" }}, valid_session
        assigns(:cadastros_veiculo).should eq(veiculo)
      end

      it "re-renders the 'edit' template" do
        veiculo = Cadastros::Veiculo.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cadastros::Veiculo.any_instance.stub(:save).and_return(false)
        put :update, {:id => veiculo.to_param, :cadastros_veiculo => { "descricao" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cadastros_veiculo" do
      veiculo = Cadastros::Veiculo.create! valid_attributes
      expect {
        delete :destroy, {:id => veiculo.to_param}, valid_session
      }.to change(Cadastros::Veiculo, :count).by(-1)
    end

    it "redirects to the cadastros_veiculos list" do
      veiculo = Cadastros::Veiculo.create! valid_attributes
      delete :destroy, {:id => veiculo.to_param}, valid_session
      response.should redirect_to(cadastros_veiculos_url)
    end
  end

end
