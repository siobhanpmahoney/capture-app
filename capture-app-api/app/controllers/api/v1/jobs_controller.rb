class Api::V1::JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
    company = @job.company
    category = Category.find(@job.category_id)
    render json: {job: @job, company: company, category: category}
  end

  def index
    @jobs = Job.all
    render json: @jobs
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.find_by(museId: params[:museId])
    if @job
      @job.update(job_params)
    else
      @job.create(job_params)
    end
    redirect_to @job
  end



  private

  def job_params
    params.require(:job).permit(
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
      :company_id,
      company: [
        :name,
        :size,
        :location,
        :description,
        :museId,
        :twitter,
        :image_link,
        :image_link2,
        :image_mini,
        :company_logo,
        :industry_name,
        :industry_id
      ],
      note_ids: [],
      notes_ids: [
        :title,
        :content,
        :user_id,
        :job_id,
        :company_id
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
      ])
  end


end
