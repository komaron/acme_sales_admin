require 'test_helper'
  class SaleReportTest < ActiveSupport::TestCase
    test 'sales report should be not be successful' do
      report = Acme::SaleReport.new()

      refute(report.success?)
    end

    test 'sales report should be successful' do
      report = Acme::SaleReport.new()
      report.sales.new(
        id: 1,
        customer_name: "Jack Burton",
        item_description: "Premium Cowboy Boots",
        item_price: "149.99",
        quantity: 1
      )

      assert(report.success?)
    end
end

