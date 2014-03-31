Contromaq::Application.routes.draw do

  get "acfmf/index"

  resources :abastecimentos
  resources :acfmf

  namespace :cadastros do
    resources :veiculos
    resources :usuarios
  end


  devise_for :usuarios, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { sessions: 'sessions' }

  match 'acfmf' => 'application#acfmf'

  root to: 'cadastros/veiculos#index'
end