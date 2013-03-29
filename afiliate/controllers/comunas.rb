# encoding: utf-8
Afiliate.controllers :comunas do

  get :show, with: :id do
    @comuna  = Comuna.get(params[:id])
    @piratas = Pirata.count(:comuna => @comuna.id)

    if @piratas < 3 then
      @conclusion = 'cuando haya al menos 3 te convocaremos a una reunión'

    elsif @piratas < 4
      @conclusion = '¡ya se juntaron la cantidad necesaria de piratas para
      convocar a una reunión, pronto te estará llegando invitación a
      participar!'

    else
      @conclusion = '¡pronto te estaremos convocando a la reunión pirata de tu
      comuna!'
    end

    render "comunas/show", :locals => {
      :comuna => @comuna,
      :piratas => @piratas,
      :conclusion => @conclusion
    }
  end

  get :index do
    render 'comunas/index'
  end

end
