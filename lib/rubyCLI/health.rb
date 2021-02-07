require_relative 'cli'
require 'httparty'
require "pry"

class Health

    @@all = []


    attr_accessor :symbol, :fiscalDateEnding, :profit_margin, :industry, :operating_margin_TTM
    attr_reader :totalAssets, :totalLiabilities, :totalShareholdersEquity

    def initialize(symbol, totalLiabilities, totalAssets, fiscalDateEnding)

        @symbol = symbol
        @fiscalDateEnding = fiscalDateEnding
        @totalAssets = totalAssets.to_i
        @totalLiabilities = totalLiabilities.to_i
        @@all << self

    end

    def self.all
        @@all
    end
 
    def liquidity
        @liquidity = @totalAssets / @totalLiabilities
    end

    def solvency
        # binding.pry

        if @totalLiabilities != nil && @totalShareholdersEquity != nil
            if @totalLiabilities != 0 && @totalShareholdersEquity != 0
                @solvency = (@totalLiabilities / @totalShareholdersEquity.to_i) * 100
            else
                @solvency = 0
            end
        else 
            @solvency = 0
        end
    end

    # def pillars_hash
    #     # /pillars_hash = {}
    # end

    def four_pillars
        pillars_hash = {}
        # TO Do, call methods liquidity and solvency methods above to get values
        
        # Here I am creating case statements for my instance variables
        # When the case statements are satified variables are created for each case statement
        # I then store those variables into a hash, #pillars_hash 
        # and finally pass #pillars_hash to the CLI class to be displayed to the user
        # liquidity = 7


        # solvency = 40
        # profit_margin = 10
        # operating_margin_TTM = 100

        
        case
        when liquidity >= 1
            fluid = "This company has #{liquidity} times its assets and great for business."
            pillars_hash[:fluid] = fluid
        when liquidity <= 1
            not_fluid = "This company has #{liquidity} times its assets and not as great for business."
            pillars_hash[:not_fluid] = not_fluid
        end

        case solvency
        when solvency > 40
            more_risk = "This company has a #{solvency} percent debt ratio and more debt isn't always good. That's generally a red flag."
            pillars_hash[:more_risk] = more_risk
        when 1..40
            less_debt = "This company has a #{solvency} percent debt ratio and lower debt ratios are a great sign!"
            pillars_hash[:less_debt] = less_debt
        when nil
            not_enough_data = "Not enough data"
            pillars_hash[:not_enough_data] = not_enough_data
        else
            insufficient_data = "This company has zero liabilities and zero shareholders equity. Insufficient data."
            pillars_hash[:insufficient_data] = insufficient_data
        end
        # binding.pry
        case operating_margin_TTM
        when operating_margin_TTM.to_i >= 15
            good_op_health = "#{symbol}, is currently in great operational health!"
            pillars_hash[:good_op_health] = good_op_health
        when 11..14
            acc_op_health = "#{symbol}, is currently in great operational health!"
            pillars_hash[:acc_op_health] = acc_op_health
        when 1..10
            bad_op_health = "Proceed with caution!#{symbol}, is currently struggling operationally."
            pillars_hash[:bad_op_health] = bad_op_health
        else
            ops_nsf = "This company is not earning any money from business operations"
            pillars_hash[:ops_nsf] = ops_nsf
        end

        case profit_margin
        when profit_margin.to_i >= 20
            high_profit = "#{symbol} is very profitable"
            pillars_hash[:high_profit] = high_profit
        when profit_margin.to_i >= 10
            avg_profit = "#{symbol} has average profitability"
            pillars_hash[:avg_profit] = avg_profit
        when profit_margin.to_i >= 5
            low_profit = "#{symbol} has low profitability"
            pillars_hash[:low_profit] = low_profit
        else
            profit_nsf = "Currently not enough money from business operations to be considered profitable"
            pillars_hash[:profit_nsf] = profit_nsf
        end
        
        pillars_hash
        # binding.pry
    end 


end