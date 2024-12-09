class BookingsController < ApplicationController
  def new
    choice = params[:choice]
    unless choice.nil?
      @booking = Booking.new
      @flight = Flight.find(choice)
      redirect_to(flights_path) if @flight.nil?

      number_of_passengers = params[:number_of_passengers].to_i

      number_of_passengers.times { @booking.passengers.build }
    else
      redirect_to flights_path
    end
  end

  def create
    @booking = Booking.new(flight: Flight.find(booking_params[:flight]))
    booking_params[:passengers_attributes].each_value do |lst|
      @booking.passengers.build(lst)
    end

    if @booking.save
      redirect_to @booking, notice: "Booked Successfully!"
    else
      redirect_to flights_url, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.require(:booking).permit(:flight, passengers_attributes: [ :name, :email ])
  end
end
