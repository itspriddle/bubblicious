module Rails
  def self.environment
    ENV['RAILS_ENV'].to_s.downcase
  end

  def self.env
    environment
  end

  def self.development?
    environment == 'development'
  end

  def self.production?
    environment == 'production'
  end

  def self.test?
    environment == 'test'
  end

  def self.none?
    environment.empty?
  end

  # For Rails 1.x
  unless self.respond_to? :root
    def self.root
      Pathname.new File.expand_path RAILS_ROOT
    end
  end

  def self.load_config(file)
    YAML.load_file root.join('config', file)
  end
end
