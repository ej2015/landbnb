module Types
  class MutationType < GraphQL::Schema::Object

    #sample payload
    #  mutation {
    #    signInUser(user: {email: "renter-3@email.com", password: "secret"}) {
    #      token
    #      user {
    #        id
    #        name
    #        email
    #      }
    #    }
    #    
    #    bookRental(rentalId: 1, startDate: "2018-09-01", stopDate:"2018-09-22", guests: 4) {
    #      id
    #      startDate
    #      stopDate
    #    }
    #    
    #    createUser(name: "Ingrid Bergman", authProvider: {email: {email: "ingrid@email.com", password:"secret"}}) {
    #      token
    #      user {
    #        id
    #        name
    #        email
    #      }
    #    }
    #  }

    field :sign_in_user, mutation: Mutations::SignInUser

    field :create_user, mutation: Mutations::CreateUser

    field :book_rental, mutation: Mutations::BookRental

  end
end
