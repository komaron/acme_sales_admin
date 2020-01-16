module Acme
  class SalesReportController < ApplicationController
    before_action :set_report, only: %i[show edit update destroy]

    def index
      @reports = Acme::SaleReport.all
      @total_sales_revenue = RevenueCalculator.new.calculate
    end

    def show; end

    def new
      @report = Acme::SaleReport.new
    end

    def edit; end

    def create
      report = CsvParser.new(params).import!

      if report.success?
        flash[:success] = 'Upload successful'
      else
        flash[:error] = 'There was a problem processing your file, pleast try again'
      end

      redirect_to '/'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Acme::SaleReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.fetch(:report, {})
    end
  end
end
