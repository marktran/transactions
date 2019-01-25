# frozen_string_literal: true

require_relative 'config/environment'
require_all 'app'

map('/') { run ApplicationController }
