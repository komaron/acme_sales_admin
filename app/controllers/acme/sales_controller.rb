module Acme
  class SalesController < ApplicationController
    before_action :set_acme_sale, only: %i[show edit update destroy]

    # GET /acme/sales
    # GET /acme/sales.json
    def index
      @acme_sales = Acme::Sale.all
    end

    # GET /acme/sales/1
    # GET /acme/sales/1.json
    def show; end

    # GET /acme/sales/new
    def new
      @acme_sale = Acme::Sale.new
    end

    # GET /acme/sales/1/edit
    def edit; end

    # POST /acme/sales
    # POST /acme/sales.json
    def create
      @acme_sale = Acme::Sale.new(acme_sale_params)

      respond_to do |format|
        if @acme_sale.save
          format.html { redirect_to @acme_sale, notice: 'Sale was successfully created.' }
          format.json { render :show, status: :created, location: @acme_sale }
        else
          format.html { render :new }
          format.json { render json: @acme_sale.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /acme/sales/1
    # PATCH/PUT /acme/sales/1.json
    def update
      respond_to do |format|
        if @acme_sale.update(acme_sale_params)
          format.html { redirect_to @acme_sale, notice: 'Sale was successfully updated.' }
          format.json { render :show, status: :ok, location: @acme_sale }
        else
          format.html { render :edit }
          format.json { render json: @acme_sale.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /acme/sales/1
    # DELETE /acme/sales/1.json
    def destroy
      @acme_sale.destroy
      respond_to do |format|
        format.html { redirect_to acme_sales_url, notice: 'Sale was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_acme_sale
      @acme_sale = Acme::Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acme_sale_params
      params.fetch(:acme_sale, {})
    end
  end
end
