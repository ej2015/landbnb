class Mutations::BookRental < GraphQL::Schema::Mutation
  argument :rental_id, Int, required: true
  argument :start_date, GraphQL::Types::ISO8601DateTime, required: true
  argument :stop_date, GraphQL::Types::ISO8601DateTime, required: true
  argument :guests, Int, required: true

  payload_type Types::BookingType

  def resolve(rental_id:, start_date:, stop_date:, guests:)
    if context[:current_user].blank?
      raise GraphQL::ExecutionError.new('Authentication required')
    end

    rental = Rental.find(rental_id)

    booking = rental.bookings.create!(
      user: context[:current_user],
      start_date: start_date,
      stop_date: stop_date,
      guests: guests
    )

    booking
  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new("No Rental with ID #{args[:rental_id]} found.")
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end

end
