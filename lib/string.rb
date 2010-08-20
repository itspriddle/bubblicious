class String
  def to_md5
    ::Digest::MD5.hexdigest self
  end

  def to_sha1
    ::Digest::SHA1.hexdigest self
  end

  def format_tn
    self.gsub(/^[1]?([2-9][0-8][0-9])([2-9][0-9]{2})([0-9]{4})$/, "(\\1) \\2-\\3")
  end

  def is_valid_tn?
    ! self.match(/^[1]?([2-9][0-8][0-9])([2-9][0-9]{2})([0-9]{4})$/).nil?
  end

  def is_valid_email_address?
    ! self.match(/\A[\w\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|jobs|museum)\z/i).nil?
  end

  alias_method :trim, :strip

end
