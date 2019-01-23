# frozen_string_literal: true

class ApplicationController < Sinatra::Base
  set :root, File.expand_path('../../', __dir__)
  set :views, -> { File.join(root, 'app/views') }
  set :public_folder, -> { File.join(root, 'public') }

  configure :development do
    register Sinatra::Reloader
  end
end
