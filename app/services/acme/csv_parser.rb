require 'csv'

module Acme
  class CsvParser
    attr_reader :data_file, :options

    def initialize(options)
      @data_file = options[:data_file]&.open || default_data_file
      @options = options['data_file']
    end

    def import!
      report = Acme::SaleReport.create(file_name: file_name)

      CSV.foreach(data_file, headers: true) do |row|
        Acme::Sale.create(
          customer_name: row['Customer Name'],
          item_description: row['Item Description'],
          item_price: row['Item Price'],
          quantity: row['Quantity'],
          merchant_name: row['Merchant Name'],
          merchant_address: row['Merchant Address'],
          sale_report_id: report.id
        )
      end

      report
    end

    private

    def default_data_file
      Rails.root.join('salesdata.csv')
    end

    def file_name
      options.present? ? options.original_filename : data_file.basename.to_s
    end
  end
end
