migration 3, :create_comunas do
  up do
    create_table :comunas do
      column :id, Integer, :serial => true
      column :nombre, String, :length => 255
      column :barrios, String, :length => 255
    end
  end

  down do
    drop_table :comunas
  end
end
