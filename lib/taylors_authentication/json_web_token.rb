require 'jwt'

module TaylorsAuthentication
  class JsonWebToken
    def self.encode(payload)
      JWT.encode(
        payload,
        ::TaylorsAuthentication.secret_key,
      )
    end

    def self.decode(token)
      JWT.decode(
        token,
        ::TaylorsAuthentication.secret_key,
      ).first # first arg is the payload, second is the header
    end
  end
end
