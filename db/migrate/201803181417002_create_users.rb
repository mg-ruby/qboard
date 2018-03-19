ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      String :name
      String :email
      String :provider
      String :uid
      String :oauth_token
      DateTime :oauth_expires_at
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end