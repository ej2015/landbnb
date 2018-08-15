#module Types
#  class AuthProviderEmailInput < Types::BaseObject
#
#    field :email, String, null: false 
#    field :password, String, null: false 
#  end
#end

module Types
  AuthProviderEmailInput = GraphQL::InputObjectType.define do
    name 'AuthProviderEmailInput'
    argument :email, !types.String
    argument :password, !types.String
  end
end
