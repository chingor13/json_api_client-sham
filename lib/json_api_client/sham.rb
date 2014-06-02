require 'json_api_client'
require 'sham_rack'

module JsonApiClient
  module Sham
    autoload :Data, 'json_api_client/sham/data'
    autoload :Server, 'json_api_client/sham/server'
  end
end