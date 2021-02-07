# Our CLI Contoller
require_relative "health"
require_relative "api"
require "pry"

class CLI

    # @@all = []

    attr_reader :pillars_hash, :fiscalDateEnding,:four_pillars

     # pull in pillars hash from health class
     def medit_health(pillars_hash)
        
        # iterate through variables in #pillars_hash
        # print values from hash to the user
        pillars_hash.each do |s, values|
            puts "--------------------------------"
            puts values
        end 
        
    end
    def end_program
        puts "Thank you for choosing Medit, see you soon!"
    end

    def call 
        puts "Hello, welcome to Medit where you can find a publicly traded company's financial health"
        symbol
        end_program
    end

    def user_last_fiscal
        @user_last_fiscal = gets.strip
    end

    def symbol
        puts "What company can I find for you? Please enter a ticket symbol i.e:SPCE"
        @input = gets.strip.upcase
        while @input != "exit"
        case @input 
        when @input.length >= 5
            puts "That wasn't a valid entry. Please enter a stock symbol or type exit to end."
        else
            
            
            runBalanceAPI = API.new
            health_object = runBalanceAPI.find_balance_sheet_company_by_symbol(@input)
            if health_object == nil
                puts "Please enter a new symbol"
            else
             
             runBalanceAPI.find_overview_by_symbol(@input, health_object)
             puts "Awesome! Now please enter the last fiscal year, for example: 2020-12-31"
                
            # To do: Make sure dates match later i.e
            # @fiscalDateEnding.detect{|input| @user_last_fiscal == @fiscalDateEnding}
            user_last_fiscal
            

            medit_health(health_object.four_pillars)
            
            end 
            
        end
    end

    
    end


end

