class UserRelation < ROM::Relation[:sql]
  gateway :default

  schema(:users, infer: true)

  # define your methods here ie:
  #
  # def all
  #   select(:id, :name).order(:id)
  # end
end