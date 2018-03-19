module SearchResults
  class Loader
    def initialize(user)
      @user = user
    end

    def load
      @user ? $redis.smembers("user_#{@user.id}_searches") : $redis.smembers("public_searches")
    end
  end
end