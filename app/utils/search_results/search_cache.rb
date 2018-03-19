module SearchResults
  class SearchCache
    def self.add(user, search_query)
      user ? $redis.sadd("user_#{user.id}_searches", search_query) : $redis.sadd("public_searches", search_query)
    end
  end
end