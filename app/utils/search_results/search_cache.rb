module SearchResults
  class SearchCache
    def self.add(user, search_query)
      query = search_query.downcase
      user ? $redis.sadd("user_#{user.id}_searches", query) : $redis.sadd("public_searches", query)
    end
  end
end