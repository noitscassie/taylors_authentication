# frozen_string_literal: true

require_relative "taylors_authentication/version"

module TaylorsAuthentication
  require 'active_support'
  require 'taylors_authentication/active_record/active_record'
  require 'taylors_authentication/active_record/class_methods'

  mattr_accessor :secret_key
  @@secret_key = []

  def self.setup
    yield self
  end
end
