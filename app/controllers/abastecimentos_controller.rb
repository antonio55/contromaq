# encoding: utf-8

class AbastecimentosController < ApplicationController
  # GET /abastecimentos
  # GET /abastecimentos.json
  def index
    if current_usuario.tipo_was_administrador?
      @abastecimentos = Abastecimento.all
    elsif current_usuario.tipo_was_organizacao?
      @abastecimentos = Abastecimento.joins(:veiculo)
      @abastecimentos = @abastecimentos.where('usuario_id = ?', current_usuario.id)
    else
      @abastecimentos = Abastecimento.joins(:veiculo)
      @abastecimentos = @abastecimentos.where('usuario_id = ?', current_usuario.usuario_id)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abastecimentos }
    end
  end

  # GET /abastecimentos/1
  # GET /abastecimentos/1.json
  def show
    carregar_veiculos
    @abastecimento = Abastecimento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @abastecimento }
    end
  end

  # GET /abastecimentos/new
  # GET /abastecimentos/new.json
  def new
    carregar_veiculos
    @abastecimento = Abastecimento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @abastecimento }
    end
  end

  # GET /abastecimentos/1/edit
  def edit
    if current_usuario.tipo_was_administrador?
      carregar_veiculos
      @abastecimento = Abastecimento.find(params[:id])
    else
      flash[:error] = "Não autorizado."
      redirect_to action: :index
    end
    
  end

  # POST /abastecimentos
  # POST /abastecimentos.json
  def create
    carregar_veiculos
    @abastecimento = Abastecimento.new(params[:abastecimento])

    respond_to do |format|
      if @abastecimento.save
        format.html { redirect_to abastecimentos_path, notice: 'Abastecimento criado com sucesso.' }
        format.json { render json: @abastecimento, status: :created, location: @abastecimento }
      else
        format.html { render action: "new" }
        format.json { render json: @abastecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /abastecimentos/1
  # PUT /abastecimentos/1.json
  def update
    carregar_veiculos
    @abastecimento = Abastecimento.find(params[:id])

    respond_to do |format|
      if @abastecimento.update_attributes(params[:abastecimento])
        format.html { redirect_to abastecimentos_path, notice: 'Abastecimento criado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @abastecimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /abastecimentos/1
  # DELETE /abastecimentos/1.json
  def destroy
    carregar_veiculos
    @abastecimento = Abastecimento.find(params[:id])
    @abastecimento.destroy

    respond_to do |format|
      format.html { redirect_to abastecimentos_url }
      format.json { head :no_content }
    end
  end

  def carregar_veiculos
    @veiculos = Cadastros::Veiculo.ativo
  end

end