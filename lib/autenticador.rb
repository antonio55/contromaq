#encoding: utf-8

class Autenticador

  def autenticou?(email,senha)
    @email_digitado = email
    @senha_digitada = senha
    return false unless email_valido?
    adicionar_acesso(@usuario.email)
  end

  def mensagem_de_erro
    if @email_valido
    else
      "Usuário ou senha inválidos."
    end
  end


private

  def email_valido?
    @usuario = Usuario.find_by_email(@email_digitado)

    @email_valido =   @usuario.present? &&
                      @usuario.active_for_authentication?  &&
                      @usuario.valid_password?(@senha_digitada)
  end

  def adicionar_acesso(login)
    @result   = {}
    @result[:sucesso]
  end
  
end