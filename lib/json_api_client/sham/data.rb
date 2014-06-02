require 'singleton'
require 'forwardable'
require 'yaml'
require 'active_support/core_ext/class/attribute'

module JsonApiClient
  module Sham
    class Data
      include Singleton
      class_attribute :fixture_path
      self.fixture_path = File.expand_path("../../../../", __FILE__)

      attr_accessor :data

      def initialize
        reload!
      end

      def reload!
        fixture_file = File.join(self.class.fixture_path, "#{name}.yml")
        @starting_id = 1000
        @data = YAML.load_file(fixture_file)
      end

      def name
        self.class.name.split("::").last.downcase
      end

      def all
        data.values
      end

      def find(param, param_name = "id")
        data[param.to_s] ||
          data.values.detect{|datum| datum[param_name.to_s].to_s == param.to_s}
      end

      def create(params)
        param = (@starting_id += 1).to_s
        data[param] = params.merge({
          "id" => param.to_i
        })
      end

      class << self
        extend Forwardable

        def_delegators :instance, :reload!, :all, :find, :create
      end
    end
  end
end