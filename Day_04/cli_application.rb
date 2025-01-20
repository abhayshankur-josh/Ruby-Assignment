=begin
  Assignment - 
   A CLI application for handling data of as many countries as we can. Example of what data that we can have:
    -Population
    -GDP(Gross Domestic Production)
    -States
    -Army Strength
    -State of country(developing, developed)
  
  On the basis of all these data we will be building modules to conceive various outputs like:
    -Whether that country will get a loan from the IMF (International Monetary Fund) or WB (World bank).
    -Whether the country can have a seat in the UN (United Nations) Security council.
    -Whether the country can win the war or not
=end

# frozen_string_literal: true
require 'io/console'
require_relative 'countries_data.rb'
require_relative 'country.rb'

# CLIApplication class to manage the CLI application.
class CLIApplication # rubocop:disable Metrics/ClassLength
  include CountriesData

  def initialize
    @countries = COUNTRIES_DATA.map do |country_data|
      Country.new(
        country_data[:country_name],
        country_data[:population],
        country_data[:gdp],
        country_data[:states],
        country_data[:army_strength],
        country_data[:development_status],
        country_data[:political_stability],
        country_data[:international_influence]
      )
    end
  end

  def main
    begin
      loop do
        system('clear')
        display_menu

        choice = $stdin.getch.to_i
        print choice

        case choice
        when 1
          add_country
        when 3
          evaluate_country
        when 2
          list_countries
        when 4
          puts "\n Exiting..."
          sleep(1)
          break
        else
          puts choice
          puts "\n Invalid choice. Please try again."
          sleep(2)
          raise
        end
      end
    rescue StandardError
      retry
    end
  end

  private

  def display_menu
    p "=== CLI Application ==="
    p "1. Add Country"
    p "2. List"
    p "3. Evaluate"
    p "4. Exit"
    print 'Choose an option:'
  end
  
  def evaluate_country
    puts
    @countries.each_with_index { |country, index| puts "#{index + 1}. #{country.country_name}" }
    print "Choose a country to evaluate:"
    country_index = gets.chomp.to_i - 1
    raise 'Invalid country index.' if country_index.negative? || country_index >= @countries.size
    p "\nEvaluate..."
    p "\n #{@countries[country_index].get_loan}"
    p "\n #{@countries[country_index].seat_in_council}"
    p "\n #{@countries[country_index].win_war}"
    puts 'Press any key to continue...'
    $stdin.getch
  end

  def list_countries
    puts
    print 'Listing countries...'
    puts
    @countries.each { |country| puts country.to_s }
    puts 'Press any key to continue...'
    $stdin.getch        
  end

  def add_country
    puts
    p 'Enter country name:'
    name = gets.chomp

    puts
    p 'Enter population:'
    population = gets.chomp.to_i

    puts
    p 'Enter GDP:'
    gdp = gets.chomp.to_i

    puts
    p 'Enter number of states:'
    states = gets.chomp.to_i

    puts
    p 'Enter army strength:'
    army_strength = gets.chomp.to_i

    puts
    p 'Enter development status:'
    development_status = gets.chomp

    puts
    p 'Enter political stability:'
    political_stability = gets.chomp

    puts
    p 'Enter international influence:'
    international_influence = gets.chomp

    @countries << Country.new(
      name, population, gdp, states, army_strength, development_status, political_stability, international_influence
    )

    puts
    p 'Country added successfully.'
  end
end

# Running the CLI application.
CLIApplication.new.main
