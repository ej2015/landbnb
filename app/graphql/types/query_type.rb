module Types
  class QueryType < BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :rentals, [Types::RentalType], null: true do
      description 'List all rentals'
      argument :limit, Integer, required: false
    end 

    field :rental, Types::RentalType, null: false do
      description 'A rental'
      argument :id, ID, required: true
    end

    field :bookings, [Types::BookingType], null: false do
      description 'List of all bookings'
      argument :limit, Integer, required: false
    end

    def bookings(limit: nil)
      Booking.all.limit(limit || 10)
    end

    def rental(id: nil)
      Rental.find(id)
    end

    def rentals(limit: nil)
      Rental.all.limit(limit || 20)
    end
  end
end
