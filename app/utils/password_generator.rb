class PasswordGenerator
  CHARS = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a.freeze
  def self.random_password(length = 10)
    CHARS.sort_by { rand }.join[0...length]
  end
end