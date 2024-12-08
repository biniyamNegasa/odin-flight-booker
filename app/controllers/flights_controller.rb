class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |airport| airport.airport_code }
    @dates = Flight.select(:start_datetime).map do |flight|
                flight.start_datetime.strftime("%d %B %Y")
             end.uniq
    current_data = flight_params
    if current_data && current_data[:date]
      @flights = Flight.where("departure_airport_id = ? AND arrival_airport_id = ? AND start_datetime BETWEEN ? AND ?",
                              Airport.where(airport_code: current_data[:departure_airport]).first,
                              Airport.where(airport_code: current_data[:arrival_airport]).first,
                              Date.strptime(current_data[:date], "%d %B %Y"),
                              DateTime.strptime(current_data[:date], "%d %B %Y") + 23.hours + 59.minutes)
    end
  end

  private
  def flight_params
    params.permit(:departure_airport, :arrival_airport, :number_of_passengers, :date)
  end
end
