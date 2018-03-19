ROM::SQL.migration do
  change do
    create_table :questions do
      primary_key :id
      column :title, String, null: false
      column :body, String, null: false
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end

