require 'csv'

module Acme
  class CsvParser
    attr_reader :data_file

    def initialize(options)
      @data_file = options[:data_file] || default_data_file
    end

    def import!
      CSV.foreach(data_file, headers: true) do |row|
        Acme::Sale.create(
          customer_name:      row['Customer Name'],
          item_description:   row['Item Description'],
          item_price:         row['Item Price'],
          quantity:           row['Quantity'],
          merchant_name:      row['Merchant Name'],
          merchant_address:   row['Merchant Address']
        )
      end
    end

    def default_data_file
      Rails.root.join('salesdata.csv')
    end
  end
end
