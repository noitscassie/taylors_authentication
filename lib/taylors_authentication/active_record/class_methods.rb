
module TaylorsAuthentication
  module ActiveRecord
    module ClassMethods
      def authenticable
        define_lookup_method
        define_getter_method
      end

      private

      def define_lookup_method
        define_singleton_method(:find_by_auth_token) do |auth_token|
          return if auth_token.blank?

          find_by(
            id: ::TaylorsAuthentication::JsonWebToken.decode(auth_token),
          )
        end
      end

      def define_getter_method
        define_method(:auth_token) do
          ::TaylorsAuthentication::JsonWebToken.encode(id)
        end
      end
    end
  end
end
