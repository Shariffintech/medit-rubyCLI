require_relative 'health'
require'httparty'
require 'dotenv'
require 'pry'

#Problems: Looking for symbol need to make sure we handle errors for invalid symbols , We need to make sure fiscal dates match 

Dotenv.load('../../.env')

class API 
    
  
  def find_balance_sheet_company_by_symbol(symbol)
 
        api_hash = {}

        
        apikey = ENV['API_KEY']
        url_one = "https://www.alphavantage.co/query?function=BALANCE_SHEET&symbol=IBM&apikey=demo"
    
        req_url = "#{url_one}/function=BALANCE_SHEET&symbol=#{symbol}&apikey=#{apikey}"
       
        data = HTTParty.get(req_url)
        if data["annualReports"] == nil
            return nil
        else
            data["annualReports"].each do |i|
            api_hash = {
                symbol: data["symbol"],
                totalLiabilities: i["totalLiabilities"],
                totalAssets: i["totalAssets"],
                fiscalDateEnding: i["fiscalDateEnding"]
            }
            end
        end
        health_object = Health.new(api_hash[:symbol],api_hash[:totalLiabilities],api_hash[:totalAssets],api_hash[:fiscalDateEnding])
        health_object
        
     end

            # symbol": "IBM",
            # "annualReports": [
            #     {
            #         "fiscalDateEnding": "2020-12-31",
            #         "reportedCurrency": "USD",
            #         "totalAssets": "155971000000",
            #         "intangibleAssets": "13796000000",
            #         "earningAssets": "None",
            #         "otherCurrentAssets": "2570000000",
            #         "totalLiabilities": "135245000000",
            #         "totalShareholderEquity": "20597000000",
            #         "deferredLongTermLiabilities": "2449000000",
            #         "otherCurrentLiabilities": "26421000000",
            #         "commonStock": "56556000000",
            #         "retainedEarnings": "162717000000",
            #         "otherLiabilities": "37447000000",
            #         "goodwill": "59617000000",
            #         "otherAssets": "19299000000",
            #         "cash": "13212000000",
            #         "totalCurrentLiabilities": "39869000000",
            #         "shortTermDebt": "None",
            #         "currentLongTermDebt": "7183000000",
            #         "otherShareholderEquity": "-29337000000",
            #         "propertyPlantEquipment": "14726000000",
            #         "totalCurrentAssets": "39165000000",
            #         "longTermInvestments": "2282000000",
            #         "netTangibleAssets": "-52816000000",
            #         "shortTermInvestments": "600000000",
            #         "netReceivables": "7846000000",
            #         "longTermDebt": "54355000000",
            #         "inventory": "1839000000",
            #         "accountsPayable": "4908000000",
            #         "totalPermanentEquity": "None",
            #         "additionalPaidInCapital": "None",
            #         "commonStockTotalEquity": "None",
            #         "preferredStockTotalEquity": "None",
            #         "retainedEarningsTotalEquity": "None",
            #         "treasuryStock": "-169339000000",
            #         "accumulatedAmortization": "None",
            #         "otherNonCurrrentAssets": "None",
            #         "deferredLongTermAssetCharges": "None",
            #         "totalNonCurrentAssets": "116807000000",
            #         "capitalLeaseObligations": "4931000000",
            #         "totalLongTermDebt": "54355000000",
            #         "otherNonCurrentLiabilities": "14898000000",
            #         "totalNonCurrentLiabilities": "95376000000",
            #         "negativeGoodwill": "None",
            #         "warrants": "None",
            #         "preferredStockRedeemable": "None",
            #         "capitalSurplus": "None",
            #         "liabilitiesAndShareholderEquity": "None",
            #         "cashAndShortTermInvestments": "13812000000",
            #         "accumulatedDepreciation": "None",
            #         "commonStockSharesOutstanding": "None"
            #     },

            # }
            # API.new(symbol_hash)
    
        
        
   
    def find_overview_by_symbol(symbol, health_object)

        
        apikey = ENV['API_KEY']
        url_two = "https://www.alphavantage.co/query?function=OVERVIEW&symbol=PTON&apikey=demo"
    
        req_url = "#{url_two}/function=OVERVIEW&symbol=#{symbol}&apikey=#{apikey}"
        data = HTTParty.get(req_url)
        
    
        
        health_object.operating_margin_TTM = data["OperatingMarginTTM"]
        health_object.profit_margin = data["ProfitMargin"]
        health_object.industry = data["Industry"]
        
     end

                # "Symbol": "IBM",
                # "AssetType": "Common Stock",
                # "Name": "International Business Machines Corporation",
                # "Description": "International Business Machines Corporation provides integrated solutions and services worldwide. Its Cloud & Cognitive Software segment offers software for vertical and domain-specific solutions in health, financial services, and Internet of Things (IoT), weather, and security software and services application areas; and customer information control system and storage, and analytics and integration software solutions to support client mission critical on-premise workloads in banking, airline, and retail industries. It also offers middleware and data platform software, including Red Hat that enables the operation of clients' hybrid multi-cloud environments; and Cloud Paks, WebSphere distributed, and analytics platform software, such as DB2 distributed, information integration, and enterprise content management, as well as IoT, Blockchain and AI/Watson platforms. The company's Global Business Services segment offers business consulting services; system integration, application management, maintenance, and support services for packaged software; finance, procurement, talent and engagement, and industry-specific business process outsourcing services; and IT infrastructure and platform services. Its Global Technology Services segment provides project, managed, outsourcing, and cloud-delivered services for enterprise IT infrastructure environments; and IT infrastructure support services. The company's Systems segment offers servers for businesses, cloud service providers, and scientific computing organizations; data storage products and solutions; and z/OS, an enterprise operating system, as well as Linux. Its Global Financing segment provides lease, installment payment, loan financing, short-term working capital financing, and remanufacturing and remarketing services. The company was formerly known as Computing-Tabulating-Recording Co. The company was founded in 1911 and is headquartered in Armonk, New York.",
                # "Exchange": "NYSE",
                # "Currency": "USD",
                # "Country": "USA",
                # "Sector": "Technology",
                # "Industry": "Information Technology Services",
                # "Address": "One New Orchard Road, Armonk, NY, United States, 10504",
                # "FullTimeEmployees": "0",
                # "FiscalYearEnd": "December",
                # "LatestQuarter": "2020-12-31",
                # "MarketCapitalization": "106133798912",
                # "EBITDA": "13509000192",
                # "PERatio": "19.1219",
                # "PEGRatio": "1.2258",
                # "BookValue": "23.075",
                # "DividendPerShare": "6.52",
                # "DividendYield": "0.0547",
                # "EPS": "6.229",
                # "RevenuePerShareTTM": "82.691",
                # "ProfitMargin": "0.0759",
                # "OperatingMarginTTM": "0.0926",
                # "ReturnOnAssetsTTM": "0.0276",
                # "ReturnOnEquityTTM": "0.2638",
                # "RevenueTTM": "73619996672",
                # "GrossProfitTTM": "35575000000",
                # "DilutedEPSTTM": "6.229",
                # "QuarterlyEarningsGrowthYOY": "-0.632",
                # "QuarterlyRevenueGrowthYOY": "-0.065",
                # "AnalystTargetPrice": "137",
                # "TrailingPE": "19.1219",
                # "ForwardPE": "10.661",
                # "PriceToSalesRatioTTM": "1.4442",
                # "PriceToBookRatio": "5.1299",
                # "EVToRevenue": "2.1505",
                # "EVToEBITDA": "12.5451",
                # "Beta": "1.2416",
                # "52WeekHigh": "150.8394",
                # "52WeekLow": "86.9458",
                # "50DayMovingAverage": "125.3382",
                # "200DayMovingAverage": "122.7522",
                # "SharesOutstanding": "891057024",
                # "SharesFloat": "891011172",
                # "SharesShort": "26222888",
                # "SharesShortPriorMonth": "22915875",
                # "ShortRatio": "5.39",
                # "ShortPercentOutstanding": "0.03",
                # "ShortPercentFloat": "0.0295",
                # "PercentInsiders": "0.128",
                # "PercentInstitutions": "58.584",
                # "ForwardAnnualDividendRate": "6.52",
                # "ForwardAnnualDividendYield": "0.0547",
                # "PayoutRatio": "0.752",
                # "DividendDate": "2020-12-10",
                # "ExDividendDate": "2021-02-09",
                # "LastSplitFactor": "2:1",
                # "LastSplitDate": "1999-05-27"
end

# # Test cases
# runBalanceAPI = API.new
# health_object = runBalanceAPI.find_balance_sheet_company_by_symbol("PTON")
# runBalanceAPI.find_overview_by_symbol("PTON", health_object)

