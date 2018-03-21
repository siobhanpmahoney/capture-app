class Api::V1::BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    render json: @bookmarks
  end

  def create
    # @bookmark = Bookmark.create(bookmark_params)

    @bookmark = Bookmark.create(title: params[:bookmark][:title], source_name: params[:bookmark][:source_name], summary: params[:bookmark][:summary], url: params[:bookmark][:url], user_id: params[:bookmark][:user_id], company_id: params[:bookmark][:company_id])
    render json: @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update(bookmark_params)
    render json: @bookmark, status: 200
  end

  def destroy
    bookmarkId = @bookmark.id
    @bookmark.destroy
    render json: {message:"Zap! Bookmark deleted", bookmarkId:bookmarkId}
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    bookmark_company = Company.find(params[:company_id])
    bookmark_job = Job.find(params[:job_id])
    bookmark_user = User.find(params[:user_id])
    bookmark_info = {bookmark: @bookmark, company: bookmark_company, job: bookmark_job, user: bookmark_user}
    render json: bookmark_info, status: 200
  end

  private
  def bookmark_params
    params.permit(:title, :source_name, :summary, :url, :user_id, :company_id, :job_id)
  end

end
