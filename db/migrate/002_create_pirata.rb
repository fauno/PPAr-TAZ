migration 2, :create_pirata do
  up do
    create_table :pirata do
      column :id, Integer, :serial => true
      column :nombre, String, :length => 255
      column :mail, String, :length => 255
      column :comuna, Integer
    end
  end

  down do
    drop_table :pirata
  end
end
