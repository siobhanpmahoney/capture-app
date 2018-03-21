class Api::V1::IndustriesController < ApplicationController

  def index
    @industries = Industry.all
    render json: @industries, status: 200
  end

  def create
    @industry = Industry.create(industry_params)
    render json: @industry
  end

  def update
    @industry = Industry.find(params[:id])
    @industry.update(industry_params)
    render json: @industry, status: 200
  end

  def destroy
    industryId = @industry.id
    @industry.destroy
    render json: {message:"Industry has been deleted", industryId:industryId}
  end

  def show
    @industry = Industry.find(params[:id])
    industry_companies = @industry.companies
    industry_info = {industry: @industry, companies: industry_companies}
    render json: industry_info, status: 200
  end

  private

  def industry_params
    params.require(:industry).permit(:name, company_ids: [], companies_attributes: [:name,
    :size,
    :location,
    :description,
    :museId,
    :twitter,
    :image_link,
    :image_link2,
    :image_mini,
    :company_logo,
    :industry_id])
  end
end
