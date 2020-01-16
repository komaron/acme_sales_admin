module Acme
  class RevenueCalculator
    def calculate
      sales.sum { |sale| sale.quantity * sale.item_price.to_f }
    end

    private

    def sales
      @sales ||= Acme::Sale.all
    end
  end
end
