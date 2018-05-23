class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy]
  layout "admin", only: [:new, :edit]
  # GET /lectures
  # GET /lectures.json



  def index
    @course = Course.find(params[:course_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
    @course = Course.find(params[:course_id])
    @chapter = Chapter.find(params[:chapter_id])
    @lecture_count = LectureCount.new

    @lecture_count.user_id = current_user.id
    @lecture_count.lecture_id = params[:id]
    if @lecture_count.count.nil?
      @lecture_count.count = 0
      @lecture_count.count = @lecture_count.count.to_i + 1 
  else
    @lecture_count.count = @lecture_count.count.to_i +1
  end
  @lecture_count.save

    @lecture = @chapter.lectures.find(params[:id])
    @comment = @lecture.comments.build
  end

  # GET /lectures/new
  def new

    @chapter= Chapter.find(params[:chapter_id])
    @lecture = @chapter.lectures.build
    @course = Course.find(params[:course_id])
  end

  # GET /lectures/1/edit
  def edit
    @course = Course.find(params[:course_id])
     @chapter = Chapter.find(params[:chapter_id])
    @lecture= @chapter.lectures.find(params[:id])
  end

  # POST /lectures
  # POST /lectures.json
  def create

     
     @course = Course.find(params[:course_id])
    chapter = Chapter.find(params[:chapter_id])

    @lecture = chapter.lectures.new(lecture_params)
    params[:lecture][:video_url] = params[:lecture][:video_url].split("=")[1].split("&").first
    respond_to do |format|
      if @lecture.save
        format.html { redirect_to([@course, @lecture.chapter, @lecture], :notice => 'Lecture was successfully created.')}
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json
  def update
   params[:lecture][:video_url] = params[:lecture][:video_url].split("=")[1].split("&").first
    binding.pry   
    @course = Course.find(params[:course_id])
    chapter = Chapter.find(params[:chapter_id])
    @lecture = chapter.lectures.find(params[:id])
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to([@course, @lecture.chapter, @lecture], :notice => 'Lecture was successfully created.')}
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    chapter = Chapter.find(params[:chapter_id])
      @lecture = chapter.lectures.find(params[:id])
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to([@course, @lecture.chapter, @lecture], :notice => 'Lecture was successfully deleted.')}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:name, :chapter_id, :description, :video_url, :video_duration, :course_id, :instructor_id)
    end
end
