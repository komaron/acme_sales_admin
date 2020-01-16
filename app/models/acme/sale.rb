module Acme
  class Sale < ApplicationRecord
    belongs_to :sale_report

    validates :item_price, presence: true
    validates :quantity, presence: true
  end
end
