require 'rest-client'
require 'json'

module Currency
  def self.exchange currency_base, currency_destination, quantity
    begin
      #res = RestClient.get "http://api.fixer.io/latest?base=#{currency}&symbols=#{currency_destination}"
      res = RestClient.get "https://api.exchangeratesapi.io/latest?base=#{currency_base}"
      value = JSON.parse(res.body)['rates'][currency_destination]
      return (value * quantity).round(2)
    rescue
      return "A conversão falhou."
    end
  end
end