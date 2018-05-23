class ViewershipsController < ApplicationController
  before_action :set_viewership, only: [:show, :edit, :update, :destroy]

  # GET /viewerships
  # GET /viewerships.json
  def index
    @viewerships = Viewership.all
  end

  # GET /viewerships/1
  # GET /viewerships/1.json
  def show
  end

  # GET /viewerships/new
  def new
    @viewership = Viewership.new
  end

  # GET /viewerships/1/edit
  def edit
  end

  # POST /viewerships
  # POST /viewerships.json
  def create
    @viewership = Viewership.new(viewership_params)

    respond_to do |format|
      if @viewership.save
        format.html { redirect_to @viewership, notice: 'Viewership was successfully created.' }
        format.json { render :show, status: :created, location: @viewership }
      else
        format.html { render :new }
        format.json { render json: @viewership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viewerships/1
  # PATCH/PUT /viewerships/1.json
  def update
    respond_to do |format|
      if @viewership.update(viewership_params)
        format.html { redirect_to @viewership, notice: 'Viewership was successfully updated.' }
        format.json { render :show, status: :ok, location: @viewership }
      else
        format.html { render :edit }
        format.json { render json: @viewership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viewerships/1
  # DELETE /viewerships/1.json
  def destroy
    @viewership.destroy
    respond_to do |format|
      format.html { redirect_to viewerships_url, notice: 'Viewership was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viewership
      @viewership = Viewership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viewership_params
      params.require(:viewership).permit(:lecture_id, :user_id, :fully_watched_vedio)
    end
end
