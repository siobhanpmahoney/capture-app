class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    jobs = @user.jobs
    bookmarks = @user.bookmarks
    notes = @user.notes
    companies = @user.user_companies

    categories = @user.user_categories
    bookmarks = @user.bookmarks
    industries = @user.user_industries
    user_info = {user: @user, jobs: jobs, companies: companies, notes: notes, bookmarks: bookmarks, categories: categories, industries: industries}
    render json: user_info, status: 200
  end

  def new
    @user = User.new
  end

  def create
    @user.create(
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user
      render json: @user
    else
      render json: {message: "Error, new user not saved"}
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    render json: @user
  end

  def user_jobs
    @user = User.find(params[:id])
    user_jobs = @user.jobs
    render json: user_jobs
  end

  def user_job
    @user = User.find(params[:id])
    @job = Job.find(params[:job_id])
    user_job = @user.jobs.find(@job.id)

    render json: user_job
  end

  def user_companies
    @user = User.find(params[:id])
    render json: @user.user_companies
  end

  def user_company
    @user = User.find(params[:id])
    @company = Company.find(params[:company_id])
    company_notes = @user.notes.find_by(company_id: @company.id)

    company_jobs = @user.jobs.select {|j| j.company_id == @company.id }


    company_bookmarks = @user.bookmarks.find_by(company_id: @company.id)
    company_info = {company: @company, company_notes: company_notes, company_jobs: company_jobs, company_bookmarks: company_bookmarks}
    render json: company_info
  end

  def add_jobs

    @user = User.find(params[:id])

    @company = Company.find_or_create_by(museId: params[:jobs][:company_museId])
    apiUrl = "https://api-v2.themuse.com/companies/" + @company.museId.to_s + "?api-key=82b2d1f745512b99a70044e6c6b316d86739a97719d5e88caf67a3f7fd788a00"
    companyApiCall = JSON.parse(RestClient.get(apiUrl))

    @industry = Industry.find_or_create_by(name: companyApiCall["industries"][0]["name"])

    if params["jobs"]["category"]
      @category = Category.find_or_create_by(name: params["jobs"]["category"]["name"])
    end

    @company.update(
      name: companyApiCall["name"],
      size: companyApiCall["size"]["name"],
      location: companyApiCall["locations"][0]["name"],
      description: companyApiCall["description"],
      museId: companyApiCall["id"],
      twitter: companyApiCall["twitter"],
      image_link: companyApiCall["refs"]["f1_image"],
      image_link2: companyApiCall["refs"]["f2_image"],
      image_mini: companyApiCall["refs"]["mini_f1_image"],
      company_logo: companyApiCall["refs"]["logo_image"],
      industry_id: @industry.id,
      industry_name: @industry.name,
    )

    @job = Job.create(
      title: params[:jobs][:title],
      date_published: params[:jobs][:date_published],
      contents: params[:jobs][:contents],
      museId: params[:jobs][:museId],
      location: params[:jobs][:location],
      level: params[:jobs][:level],
      company_name: @company.name,
      company_museId: params[:jobs][:company_museId],
      date_saved: DateTime.now,
      overall_active_status: true,
      applied_status: false,
      company_industry: @industry.name,
      company_id: @company.id
    )

    if @category
      @job.update(category_name: @category.name, category_id: @category.id)
    end

    @user.jobs << @job
    render json: @user.jobs
  end

  def update_job
    @user = User.find(params[:id])
    puts "@user"
    puts @user
    @job = @user.jobs.find(params[:job_id])
    puts "@job"

     @user.jobs.find(params[:job_id]).update(
     #  applied_status: params[:applied_status],
     #  date_applied: params[:date_applied],
     #  interview_invite: params[:interview_invite],
     #  interview_1_date: params[:interview_1_date],
     #  interview_1_type: params[:interview_1_type],
     #  interview_2_date: params[:interview_2_date],
     #  interview_2_type: params[:interview_2_type]
     # )
    overall_active_status: params[:overall_active_status],
    applied_status: params[:applied_status],
    date_applied: params[:date_applied],
    application_response_status: params[:application_response_status],
    interview_invite: params[:interview_invite],
    interview_1_date: params[:interview_1_date],
    interview_1_type: params[:interview_1_type],
    interview_1_technical: params[:interview_1_technical],
    interview_1_response: params[:interview_1_response],
    interview_2_date: params[:interview_2_date],
    interview_2_type: params[:interview_2_type],
    interview_2_technical: params[:interview_2_technical],
    interview_2_response: params[:interview_2_response],
    interview_3_date: params[:interview_3_date],
    interview_3_type: params[:interview_3_type],
    interview_3_technical: params[:interview_3_technical],
    interview_3_response: params[:interview_3_response],
    offer_status: params[:offer_status]
  )

    render json: {alert: "job saved!"}
  end

  def destroy_user_job
    @user = User.find(params[:id])
    @job = @user.jobs.find(params[:job_id])
    puts ("here i am... before destroy")
    puts @user.jobs
    puts @user.jobs.length
    @user.jobs.destroy(@job)
    puts "here i am after destroy"
    puts @user.jobs
    puts @user.jobs.length

    render json: {alert: "job deleted"}
  end

  def user_notes
    @user = User.find(params[:id])
    user_notes = @user.notes
    render json: user_notes
  end

  def add_notes

    @user = User.find(params[:id])

    puts @user


    @note = Note.create(title: params[:notes][:title], content: params[:notes][:content], user_id: @user.id, company_id: params[:notes][:company_id], job_id: params[:notes][:job_id])

    @user.notes << @note
    render json: @note
  end


  def notes_and_bookmarks
    @user = User.find[params[:id]]
    notes = @user.notes
    bookmarks = @user.bookmarks
    notes_and_bookmarks = {user: @user, notes: notes, bookmarks: bookmarks}
    render json: notes_and_bookmarks
  end



private

def user_params
  params.require(:user).permit(
    :username, :password, :password_confirmation,
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
      :company_id,
      category: [
        :name
      ]
    ],
    note_ids: [],
    notes_attributes: [
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
    ]
  )
end


end
