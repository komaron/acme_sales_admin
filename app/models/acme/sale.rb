module Acme
  class Sale < ApplicationRecord

    validates :item_price, presence: true
    validates :quantity, presence: true
  end
end
