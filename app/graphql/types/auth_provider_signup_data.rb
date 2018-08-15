#module Types
#  class AuthProviderSignupData < Types::BaseObject
#    argument :email, Types::AuthProviderEmailInput, null: false 
#  end
#end

module Types
  AuthProviderSignupData = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'
    argument :email, Types::AuthProviderEmailInput
  end
end
