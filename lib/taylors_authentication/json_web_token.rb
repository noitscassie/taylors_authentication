module TaylorsAuthentication
  module JsonWebToken
    extend ActiveSupport::Concern

    class_methods do
      def encode(payload)
        JWT.encode(
          payload,
          ::TaylorsAuthentication.secret_key,
        )
      end

      def decode(token)
        JWT.decode(
          token,
          ::TaylorsAuthentication.secret_key,
        ).first # first arg is the payload, second is the header
      end
    end
  end
end
