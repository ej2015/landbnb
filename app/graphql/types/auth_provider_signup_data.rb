module Types
  class AuthProviderSignupData < Types::BaseObject
    argument :email, Types::AuthProviderEmailInput, null: false 
  end
end
