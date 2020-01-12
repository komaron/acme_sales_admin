module Acme
  class CsvParser
    attr_reader :data_file

    def initalize(options)
      @data_file = options[:data_file]
    end

    def import!
      CSV.foreach(data_file, headers: true) do |row|
        puts row.inspect
      end
    end
  end
end
