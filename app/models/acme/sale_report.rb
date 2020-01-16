module Acme
  class SaleReport < ApplicationRecord
    has_many :sales

    def success?
      sales.present?
    end
  end
end
