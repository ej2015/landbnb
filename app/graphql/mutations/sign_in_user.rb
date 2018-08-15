class Mutations::SignInUser < GraphQL::Schema::Mutation
  argument :email, Types::AuthProviderEmailInput, required: true

  payload_type Types::AuthenticateType

  def resolve(email:)
    input = email
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
