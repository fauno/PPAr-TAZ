# encoding: utf-8
Afiliate.controllers  do
  get "/" do
    # TODO Mostrar la lista de zonas que están preparando las afiliaciones
    # (actualmente sólo CABA)
    redirect url(:afiliaciones, :index)
  end
end
