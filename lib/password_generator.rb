module PasswordGenerator
  extend self

  def generate_password(length = 8)
    chars = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a
    Array.new(length) { chars[rand(chars.size)] }.join
  end

end
