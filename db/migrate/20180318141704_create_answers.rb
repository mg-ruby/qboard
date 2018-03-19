ROM::SQL.migration do
  change do
    create_table :answers do
      primary_key :id
      String :title
      String :body
      foreign_key :question_id, :questions
      column :created_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
      column :updated_at, DateTime, null: false, default: Sequel::CURRENT_TIMESTAMP
    end

    add_index :answers, :question_id
  end
end