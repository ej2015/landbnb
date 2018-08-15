class Mutations::SignInUser < GraphQL::Schema::Mutation
  argument :user, Types::AuthProviderEmailInput, required: true

  payload_type Types::AuthenticateType

  def resolve(user:)
    input = user 
    return unless input

    user = User.find_by email: input[:email]
    return unless user
    return unless user.authenticate(input[:password])

    {
      token: AuthToken.token(user),
      user: user
    }
  end


end
