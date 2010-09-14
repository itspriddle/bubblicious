module PasswordGenerator
  extend self
  def generate_password(length = 8)
    chars = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a
    Array.new(length) { chars[rand(chars.size)] }.join
  end

  # put this somewhere else (Kayako?)
  def generate_key(letter_count = 3, number_count = 5)
    numbers = Array.new(number_count) { ('0'..'9').to_a[rand(9)]  }.join
    letters = Array.new(letter_count) { ('A'..'Z').to_a[rand(25)] }.join
    "%s-%s" % [letters, numbers]
  end
end
