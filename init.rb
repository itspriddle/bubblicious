lib = File.dirname(__FILE__) + '/lib'

# Require lib/rails.rb first, as the others may depend on it
require "#{lib}/rails.rb"

(Dir["#{lib}/**/**.rb"] - ["#{lib}/rails.rb"]).sort.each do |file|
  require file
end
