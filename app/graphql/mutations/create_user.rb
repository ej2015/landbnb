class Mutations::CreateUser < GraphQL::Schema::Mutation
  argument :name, String, required: true
  argument :auth_provider, Types::AuthProviderSignupData, required: true

  payload_type Types::AuthenticateType

  def resolve(name:, auth_provider:)
    if context[:current_user].blank?
      raise GraphQL::ExecutionError.new('Authentication required')
    end

    user = User.create!(
      name: name,
      email: auth_provider[:email][:email],
      password: auth_provider[:email][:password]
    )

    {
      token: AuthToken.token(user),
      user: user
    }

  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end

end
