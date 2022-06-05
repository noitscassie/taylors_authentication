module TaylorsAuthentication
  module ActiveRecord
    ActiveSupport.on_load :active_record do
      extend ::TaylorsAuthentication::ActiveRecord::ClassMethods
    end
  end
end
