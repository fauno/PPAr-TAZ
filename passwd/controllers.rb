# encoding: utf-8
Passwd.controllers  do
  get :index do
    render  'passwd/index'
  end

  post :update do
    if params[:new] != params[:new_compare] then
      redirect "/passwd/nomatch"
    end

    if taz_ldap_passwd(params[:user], params[:current], params[:new]) then
      redirect "/passwd/success"
    else
      redirect "/passwd/error"
    end
  end

  get '/nomatch' do
    render 'passwd/message', :locals => {
      type: "error",
      title: "FAIL!",
      message: "Las contraseñas no coinciden :("
    }
  end

  get '/error' do
    render 'passwd/message', :locals => {
      type: "error",
      title: "FAIL!",
      message: "Hubo un error al cambiar tu contraseña o la contraseña actual es inválida."
    }
  end

  get '/success' do
    render 'passwd/message', :locals => {
      type: "error",
      title: "WIN!",
      message: "Ahora podés usar tu contraseña nueva."
    }
  end
end
