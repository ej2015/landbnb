module Types
  class BookingType < Types::BaseObject
    field :id, ID, null: false
    field :rental, Types::RentalType, null: false
    field :start_date, GraphQL::Types::ISO8601DateTime, null: false 
    field :stop_date, GraphQL::Types::ISO8601DateTime, null: false 

    def rental 
      object.rental
    end
  end
end
