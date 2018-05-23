class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 load_and_authorize_resource
  # GET /comments
  # GET /comments.json
  def index
    @course = Course.find(params[:course_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lecture = Lecture.find(params[:lecture_id])
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @course = Course.find(params[:course_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    params[:comment][:user_id] =current_user.id
    @course_id = Course.find(params[:course_id])
    @course = Course.find(params[:course_id])
    @chapter_id = Chapter.find(params[:chapter_id])

    @chapter = Chapter.find(params[:chapter_id])
    @lecture_id = Lecture.find(params[:lecture_id])
    @lecture = Lecture.find(params[:lecture_id])
    @comment = @lecture.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to course_chapter_lecture_path(@course, @chapter,@lecture), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { redirect_to course_chapter_lecture_path(@course,@chapter,@lecture) }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @user_id = current_user.id
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:message, :user_id, :lecture_id)
    end
end
