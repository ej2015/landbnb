module Types
  class RentalType < Types::BaseObject

    field :id, ID, null: false
    field :rental_type, String, null: false
    field :accommodates, Int, null: false
    field :postal_code, String, null: true 

    field :owner, Types::UserType, null: true do

    end 

  #  field :bookings, Types::BookingType, null: true

    def owner
      object.user
    end
  end
end
