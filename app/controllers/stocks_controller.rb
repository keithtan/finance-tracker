class StocksController < ApplicationController

	before_action :set_stock, only: [:edit, :update, :show, :destroy]

	def search
		if params[:stock]
			@stock = Stock.find_by_ticker(params[:stock])
			@stock ||= Stock.new_from_lookup(params[:stock])
		end

		if @stock
			render partial: 'lookup'
		else
			render status: :not_found, nothing: true
		end
	end

	def edit
		@stock = Stock.find(params[:id])
	end

	def update
		@stock = Stock.find(params[:id])
		if @stock.update(stock_params)
			flash[:success] = "Stock was successfully updated"
			redirect_to my_portfolio_path(@stock)
		else
			render 'edit'
		end
	end

	private
		def stock_params
			params.require(:stock).permit(:value)
		end

		def set_stock
			@stock = Stock.find(params[:id])
		end
end