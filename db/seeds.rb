# encoding: utf-8
# Seed add you the ability to populate your db.
# We provide you a basic shell for interaction with the end user.
# So try some code like below:
#
#   name = shell.ask("What's your name?")
#   shell.say name
#
email     = shell.ask "Which email do you want use for logging into admin?"
password  = shell.ask "Tell me the password to use:"

shell.say ""

account = Account.create(:email => email, :name => "Foo", :surname => "Bar", :password => password, :password_confirmation => password, :role => "admin")

if account.valid?
  shell.say "================================================================="
  shell.say "Account has been successfully created, now you can login with:"
  shell.say "================================================================="
  shell.say "   email: #{email}"
  shell.say "   password: #{password}"
  shell.say "================================================================="
else
  shell.say "Sorry but some thing went wrong!"
  shell.say ""
  account.errors.full_messages.each { |m| shell.say "   - #{m}" }
end

shell.say ""

comunas = [
  { :nombre => "Comuna 1", :barrios => "Retiro, San Nicolás, Puerto Madero, San Telmo, Monserrat y Constitución" },
  { :nombre => "Comuna 2", :barrios => "Recoleta" },
  { :nombre => "Comuna 3", :barrios => "San Cristóbal y Balvanera" },
  { :nombre => "Comuna 4", :barrios => "Boca, Barracas, Parque Patricios y Nueva Pompeya" },
  { :nombre => "Comuna 5", :barrios => "Almagro y Boedo" },
  { :nombre => "Comuna 6", :barrios => "Caballito" },
  { :nombre => "Comuna 7", :barrios => "Flores y Parque Chacabuco" },
  { :nombre => "Comuna 8", :barrios => "Villa Soldati, Villa Riachuelo y Villa Lugano" },
  { :nombre => "Comuna 9", :barrios => "Parque Avellaneda, Liniers y Mataderos" },
  { :nombre => "Comuna 10", :barrios => "Villa Real, Monte Castro, Versalles, Floresta, Vélez Sársfield y Villa Luro" },
  { :nombre => "Comuna 11", :barrios => "Villa Gral. Mitre, Villa Devoto, Villa del Parque y Villa Santa Rita" },
  { :nombre => "Comuna 12", :barrios => "Coghlan, Saavedra, Villa Urquiza y Villa Pueyrredón" },
  { :nombre => "Comuna 13", :barrios => "Belgrano, Núñez y Colegiales" },
  { :nombre => "Comuna 14", :barrios => "Palermo" },
  { :nombre => "Comuna 15", :barrios => "Chacarita, Villa Crespo, Paternal, Villa Ortúzar, Agronomía y Parque Chas" }
]

comunas.each do |comuna|
  Comuna.create(comuna)
end
