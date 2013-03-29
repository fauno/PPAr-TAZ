migration 4, :add_comuna_to_pirata do
  up do
    modify_table :pirata do
      add_column :comuna_id, Integer
    end
  end

  down do
    modify_table :pirata do
      drop_column :comuna_id
    end
  end
end
