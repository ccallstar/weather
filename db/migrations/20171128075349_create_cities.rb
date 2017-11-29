Hanami::Model.migration do
  change do
    create_table :cities do
      primary_key :id

      column :name,      String, null: false
      column :country,   String, null: false
      column :longitude, Float,  null: false
      column :latitude,  Float,  null: false 

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
