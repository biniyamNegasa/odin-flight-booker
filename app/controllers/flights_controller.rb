class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| airport.airport_code }
    @dates = Flight.select(:start_datetime).map do |flight|
                flight.start_datetime.strftime("%d %B %Y")
             end.uniq
  end
end
