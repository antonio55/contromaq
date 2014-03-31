class SessionsController < Devise::SessionsController

  def new    
    render 'new', layout: nil
  end

  def create
    if session
      super
    else
      session.delete('usuario.session')
      flash[:notice] = @autenticador.mensagem_de_erro
      render 'new',layout: nil
    end
  end

 private
   def email
     params[:usuario][:email]
   end

   def password
     params[:usuario][:password]
   end

end
