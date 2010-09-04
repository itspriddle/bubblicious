module RemoteDatabase
  extend self
  def set_database(database = '_this_isnt_the_db_youre_looking_for', env = RAILS_ENV)
    config = remote_db_config(database, env)
    config && establish_connection(config)
  end

  def remote_db_config(database = '_this_isnt_the_db_youre_looking_for', env = RAILS_ENV)
    config = YAML.load_file(Rails.root.join('config', 'database_remote.yml'))
    config[database] && config[database][env]
  end
end

ActiveRecord::Base.extend(RemoteDatabase)
