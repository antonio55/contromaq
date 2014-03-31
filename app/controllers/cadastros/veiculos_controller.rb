class Cadastros::VeiculosController < ApplicationController
  # GET /cadastros/veiculos
  # GET /cadastros/veiculos.json
  def index
    if current_usuario.tipo_was_organizacao?
      @veiculos = current_usuario.veiculos
    elsif current_usuario.tipo_was_usuario?
      @veiculos = Usuario.find(current_usuario.usuario_id).veiculos
    else
      @veiculos = Cadastros::Veiculo.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cadastros_veiculos }
    end
  end

  # GET /cadastros/veiculos/1
  # GET /cadastros/veiculos/1.json
  def show
    @cadastros_veiculo = Cadastros::Veiculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadastros_veiculo }
    end
  end

  # GET /cadastros/veiculos/new
  # GET /cadastros/veiculos/new.json
  def new
    @cadastros_veiculo = Cadastros::Veiculo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cadastros_veiculo }
    end
  end

  # GET /cadastros/veiculos/1/edit
  def edit
    @cadastros_veiculo = Cadastros::Veiculo.find(params[:id])
  end

  # POST /cadastros/veiculos
  # POST /cadastros/veiculos.json
  def create
    @cadastros_veiculo = Cadastros::Veiculo.new(params[:cadastros_veiculo])

    respond_to do |format|
      if @cadastros_veiculo.save
        format.html { redirect_to cadastros_veiculos_path, notice: 'Veiculo criado com sucesso.' }
        format.json { render json: @cadastros_veiculo, status: :created, location: @cadastros_veiculo }
      else
        format.html { render action: "new" }
        format.json { render json: @cadastros_veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cadastros/veiculos/1
  # PUT /cadastros/veiculos/1.json
  def update
    @cadastros_veiculo = Cadastros::Veiculo.find(params[:id])

    respond_to do |format|
      if @cadastros_veiculo.update_attributes(params[:cadastros_veiculo])
        format.html { redirect_to cadastros_veiculos_path, notice: 'Veiculo Veiculo atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cadastros_veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cadastros/veiculos/1
  # DELETE /cadastros/veiculos/1.json
  def destroy
    @cadastros_veiculo = Cadastros::Veiculo.find(params[:id])
    @cadastros_veiculo.destroy

    respond_to do |format|
      format.html { redirect_to cadastros_veiculos_url }
      format.json { head :no_content }
    end
  end
end
