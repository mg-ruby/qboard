ROM::SQL.migration do
  change do
    alter_table :questions do
      add_foreign_key :user_id, :questions
    end
  end
end
