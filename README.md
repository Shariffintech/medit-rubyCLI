# Medit::RubyCLI

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/medit`. To experiment with that code, run `bin/console` for an interactive prompt.

There are a number of financial ratios that can be reviewed to gauge a company's overall financial health and to make a determination of the likelihood of the company continuing as a viable business. Four pillars of financial health that should be examined are *liquidity*, *solvency*, *profitability*, and *operating efficiency*. However, of the four, likely the best measurement of a company's health is the level of its profitability.

The purpose of this CLI, **Medit**, leverages data from the [AlphaAdvantageAPI](https://www.alphavantage.co/documentation/) to output pillars or signals to display the true financial health of a publicly-traded company. User will be able to enter the companies stock symbol and **Medit** will return the companies: 

1. **Industry -** **coming soon**
2. **Liquidity:** Current ratio = Current Assets / Current liabilities - **coming soon**
3. **Solvency:** D/E ratio = Total liabilities / Total Shareholders Equity = **coming soon**
4. **OperatingMargin, Trailing Twelve Months (TTM):** This metric indicates not only a company's basic operational profit margin after taking away the variable costs of producing and marketing the company's products or services, but it also provides an indication of how well the company's management controls costs.
5. **Profit margin:** Companies can survive for years without being profitable, operating on the goodwill of creditors and investors, but to survive in the long run, a company must eventually maintain profitability.

Statistically, an Operating Margin higher than `15%` is considered good. 

- If the company a user enters has an Operating Margin TTM ≥ `15%` the terminal will output "#{company}, is currently in great operational health!".
- If  `11 - 14%` then it will output "#{company}, has acceptable operational health but still needs improvement".
- If `1 - 10%`  then the output would be "Proceed with caution! #{company} is struggling operationally".
- Else it will print - `Not earning enough money from business operations`

An example of a *good* profit margin will vary by industry. Generally typing a `10%` net profit margin is considered average, a `20%` margin is considered high (or “good”), and a `5%` margin is low.

- If the company a user enters profit margin is `20%` ≥ the terminal will output "#{company} is very profitable".
- If the company a user enters profit margin is `10%` ≥ the terminal will output "#{company} has average profitability".
- If the company a user enters profit margin is `5%` ≥ the terminal will output "#{company} has low profitability".
- Else it will print - `Currently not enough money from business operations to be considered profitable`

CLI app with object relationships. Uses HTTParty for API calls.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'medit-RubyCLI'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install medit-RubyCLI

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/medit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/medit/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct


Everyone interacting in the Medit project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/medit/blob/master/CODE_OF_CONDUCT.md).
