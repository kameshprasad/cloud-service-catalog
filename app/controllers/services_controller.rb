class ServicesController < ApplicationController
  def index
    @service = Service.find_by(code: params[:service_code])
    filter_by_date = params[:date].present? ? DateTime.parse(params[:date]) : DateTime.now
    @pricings = @service.pricings.includes(:pricing_dimensions).where("synced_date BETWEEN ? AND ?", filter_by_date.beginning_of_day, filter_by_date.end_of_day)
  end
end
