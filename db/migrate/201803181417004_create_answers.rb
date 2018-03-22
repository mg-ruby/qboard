ROM::SQL.migration do
  change do
    create_table :answers do
      primary_key :id
      String :body
      foreign_key :question_id, :questions, on_delete: :cascade
      foreign_key :user_id, :users
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end

    add_index :answers, :question_id
    add_index :answers, :user_id
  end
end