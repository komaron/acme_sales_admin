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
    # # POST /acme/sales
    # # POST /acme/sales.json
    # def create
    #   @report = Acme::SaleReport.new(report_params)

    #   respond_to do |format|
    #     if @report.save
    #       format.html { redirect_to @report, notice: 'Report was successfully created.' }
    #       format.json { render :show, status: :created, location: @report }
    #     else
    #       format.html { render :new }
    #       format.json { render json: @report.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # PATCH/PUT /acme/sales/1
    # # PATCH/PUT /acme/sales/1.json
    # def update
    #   respond_to do |format|
    #     if @report.update(report_params)
    #       format.html { redirect_to @report, notice: 'Report was successfully updated.' }
    #       format.json { render :show, status: :ok, location: @report }
    #     else
    #       format.html { render :edit }
    #       format.json { render json: @report.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    # # DELETE /acme/sales/1
    # # DELETE /acme/sales/1.json
    # def destroy
    #   @report.destroy
    #   respond_to do |format|
    #     format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
    #     format.json { head :no_content }
    #   end
    # end

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
