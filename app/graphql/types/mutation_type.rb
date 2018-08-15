module Types
  #class MutationType < Types::BaseObject
  class MutationType < GraphQL::Schema::Object
    
    field :sign_in_user, mutation: Mutations::SignInUser

  end
end
