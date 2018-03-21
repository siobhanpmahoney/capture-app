class Api::V1::CompaniesController < ApplicationControlle

  def index
    @companies = Company.all

    render json: @companies
  end


  def show
    @company = Company.find(params[:id])
    company_jobs = @company.jobs
    company_bookmarks = @company.bookmarks
    company_notes = @company.notes
    company_info = {company: @company, company_jobs: company_jobs, company_notes: company_notes}
    render json: company_info
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.find_by(museId: params[:museId])
    if @company
      @company.update(company_params)
    else
      @company.create(company_params)
    end
    redirect_to @company
  end

  private

  def company_params
    params.require(:company).permit(
      :name,
      :size,
      :location,
      :description,
      :museId,
      :twitter,
      :image_link,
      :industry_name,
      :image_link2,
      :image_mini,
      :company_logo,
      :industry_id,
      job_ids: [],
      jobs_attributes: [
        :title,
        :date_published,
        :contents,
        :museId,
        :location,
        :level,
        :date_saved,
        :overall_active_status,
        :applied_status,
        :date_applied,
        :application_response_status,
        :interview_invite,
        :interview_1_date,
        :interview_1_type,
        :interview_1_technical,
        :interview_1_response,
        :interview_2_date,
        :interview_2_type,
        :interview_2_technical,
        :interview_2_response,
        :interview_3_date,
        :interview_3_type,
        :interview_3_technical,
        :interview_3_response,
        :offer_status,
        :company_name,
        :company_museId,
        :company_industry,
        :category_name,
        :category_id,
        :company_id
      ],
      note_ids: [],
      notes_attributes: [
        :title,
        :content,
        :user_id,
        :company_id,
        :job_id
      ],
      bookmark_ids: [],
      bookmarks_attributes: [
        :title,
        :source_name,
        :summary,
        :url,
        :user_id,
        :company_id,
        :job_id
      ]
    )
  end
end
