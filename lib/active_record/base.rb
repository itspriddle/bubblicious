module ActiveRecord
  class Base
    def self.set_remote_database(database = '_this_isnt_the_db_youre_looking_for', env = RAILS_ENV)
      config = remote_db_config(database, env)
      config && establish_connection(config)
    end

    def self.remote_db_config(database = '_this_isnt_the_db_youre_looking_for', env = RAILS_ENV)
      config = YAML.load_file(Rails.root.join('config', 'database_remote.yml'))
      config[database] && config[database][env]
    end

    def self.set_no_sti
      self.inheritance_column = :_this_column_probably_does_not_exist_
    end
  end
end
