# encoding: utf-8

class Cadastros::UsuariosController < ApplicationController
  def index
    if current_usuario.tipo_was_organizacao?
      @usuarios = current_usuario.dependentes
    elsif current_usuario.tipo_was_usuario?
      @usuarios = Usuario.find(current_usuario.id).dependentes
    else
      @usuarios = Usuario.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuario }
    end
  end

  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @usuario }
    end
  end

  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  def edit
    if current_usuario.tipo_was_usuario?
      flash[:notice] = "Você não tem autorização para continuar nessa ação."
      redirect_to action: :index
    else
      @usuario = Usuario.find(params[:id])  
    end
    
  end

  def create
    @usuario = Usuario.new(params[:usuario])

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to cadastros_usuarios_path, notice: 'Usuario criado com sucesso' }
        format.json { render json: @usuario, status: :created, location: @usuario }
      else
        format.html { render action: "new" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        format.html { redirect_to cadastros_usuarios_path, notice: 'usuario atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

	private
	def encontrar_usuario
		@usuario = Usuario.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		flash[:erro] = "Usuário ##{params[:id]} não encontrado."
		redirect_to action: :index
	end
end