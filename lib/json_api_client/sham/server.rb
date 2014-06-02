module JsonApiClient
  module Sham
    class Server < Sinatra::Base

      before do
        content_type :json
      end

      class << self
        def resource(name, resource_klass, options = {})
          name = name.to_s
          namespace = options.fetch(:namespace, "/api/1")
          base_endpoint = File.join(namespace, name)

          # GET index
          get base_endpoint do
            {
              name => Array(resource_klass.all)
            }.to_json
          end

          # POST create
          post "#{base_endpoint}.?:format?" do
            resource_params = params[name.gsub(/s?$/,"")]
            new_data = resource_klass.create(resource_params)
            {
              name => [new_data]
            }.to_json
          end

          # GET show
          get File.join(base_endpoint, ":param.?:format?") do
            {
              name => [resource_klass.find(params[:param])].compact
            }.to_json
          end
        end
      end

    end
  end
end