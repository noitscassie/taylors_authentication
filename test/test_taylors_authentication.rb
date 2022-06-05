# frozen_string_literal: true

require "test_helper"

class TestTaylorsAuthentication < Minitest::Test
  def setup
    setup_db
    TaylorsAuthentication.setup do |auth|
      auth.secret_key = 'super_secret'
    end
  end

  def teardown
    TaylorsAuthentication.setup do |auth|
      auth.secret_key = nil
    end
    teardown_db
  end

  def test_that_it_has_a_version_number
    refute_nil ::TaylorsAuthentication::VERSION
  end

  def test_it_does_something_useful
    session = Session.create
  end
end
