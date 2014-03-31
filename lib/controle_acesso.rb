class ControleAcesso

  def adicionar_acesso(login)
    @result   = {}
    url     = monta_url(URI_ACESSO)
    @result = JSON.parse(enviar_mensagem(url,usuario: login)).symbolize_keys
    puts @result.inspect
    @result[:sucesso]
  end

  def remover_acesso(login)
    return if @token.nil?

    @result   = {}
    url     = URI_REMOVE_ACESSO.gsub(':usuario',login)
    url     = monta_url(url)
    enviar_mensagem(url,_method: "delete")
  end

end