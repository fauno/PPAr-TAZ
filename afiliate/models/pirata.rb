# encoding: utf-8
class Pirata
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :nombre, String
  property :mail, String, :format => :email_address
  property :comuna, Integer
end
