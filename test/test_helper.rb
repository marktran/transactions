# frozen_string_literal: true

ENV['SINATRA_ENV'] = 'test'
ENV['RACK_ENV'] = 'test'

require_relative '../config/environment'
require 'database_cleaner'
require 'minitest/autorun'
require 'vcr'

require 'support/database_cleaner_helper'
require 'support/vcr_helper'

WebMock.disable_net_connect!
