# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

airports_codes = %w[ AAL AES AAR YXX ABZ ABR ABJ ABI AUH ABV
                    ACA ACC ADA ADD ADL ADE ADF AGA GUM BQN AGU
                    AHE AMD AJA AXT CAK ALS ABY ALB ALL ABQ ABX
                    ALY HBE AEX AXD AHO ALG ALC ASP NSB ABE AIA
                    ALA LEI AOR APN ALF ACH AOO ]
airports_codes.each do |code|
  Airport.new(airport_code: code).save
end

airports_codes.each_with_index do |code, index|
  airports_codes.each_with_index do |another_code, another_index|
    if another_index != index
      10.times do |val|
        Flight.new(start_datetime: DateTime.current + rand(200).minutes + val.days,
                   duration: 32,
                   departure_airport: Airport.where(airport_code: code).first,
                   arrival_airport: Airport.where(airport_code: another_code).first
                   ).save
      end
    end
  end
end
