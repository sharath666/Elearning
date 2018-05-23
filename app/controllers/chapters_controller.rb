class ChaptersController < ApplicationController
  #before_action :set_chapter, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  layout "chapter", only: [:new,  :edit]
 load_and_authorize_resource
  # GET /chapters
  # GET /chapters.json
  def index
    @course = Course.find(params[:course_id])
    @chapters = Chapter.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @course = Course.find(params[:course_id])
     @chapter = course.chapters.find(params[:id])
  end

  # GET /chapters/new
  def new
    @course= Course.find(params[:course_id])
    @chapter = @course.chapters.build
  end

  # GET /chapters/1/edit
  def edit
    @course = Course.find(params[:course_id])
    @chapter= @course.chapters.find(params[:id])
  end

  # POST /chapters
  # POST /chapters.json 
 def create
    course = Course.find(params[:course_id])
    @chapter = course.chapters.new(chapter_params)
    respond_to do |format|
      if @chapter.save
        format.html { redirect_to(courses_path(@courses), :notice => 'Chapter was successfully created.')}
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    @course = Course.find(params[:course_id])
    @chapter = @course.chapters.find(params[:id])
    respond_to do |format|
      if @chapter.update(chapter_params)
       format.html { redirect_to([@chapter.course, @chapter], :notice => 'Comment was successfully created.')}
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    course = Course.find(params[:course_id])
      @chapter = course.chapters.find(params[:id])
    @chapter.destroy
    respond_to do |format|
       format.html { redirect_to([@chapter.course, @chapter], :notice => 'Comment was successfully created.')}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:name, :course_id, :position)
    end
end
