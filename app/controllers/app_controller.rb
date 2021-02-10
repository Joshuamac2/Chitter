require 'sinatra/flash'

class ChitterManager < Sinatra::Base
  register Sinatra::Flash
  set :root, File.dirname(File.expand_path('..', __FILE__))
  enable :sessions, :method_override
end
