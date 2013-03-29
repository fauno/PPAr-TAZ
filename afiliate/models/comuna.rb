# encoding: utf-8
class Comuna
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :nombre, String
  property :barrios, String

  def to_liquid
    {
      'id' => self.id,
      'nombre' => self.nombre,
      'barrios' => self.barrios
    }
  end
end
