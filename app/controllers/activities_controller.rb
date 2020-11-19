class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found 
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  layout 'activity_layout'

  # GET /activities
  # GET /activities.json
  def index
    @activities = Activity.all
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    #@activity = Activity.new(activity_params)

    #respond_to do |format|
    #  if @activity.save
    #    format.html { redirect_to @activity, notice: 'Activity was successfully created.' }
    #    format.json { render :show, status: :created, location: @activity }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @activity.errors, status: :unprocessable_entity }
    #  end
    #end
	
	@activity = Activity.new(activity_params)
    if @activity.save
      flash.notice = "The activity record was created successfully."
      redirect_to @activity
    else
      flash.now.alert = @activity.errors.full_messages.to_sentence
      render :new  
    end	
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    #respond_to do |format|
    #  if @activity.update(activity_params)
    #    format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
    #    format.json { render :show, status: :ok, location: @activity }
    #  else
    #    format.html { render :edit }
    #    format.json { render json: @activity.errors, status: :unprocessable_entity }
    #  end
    #end
	
	if @activity.update(activity_params)
      flash.notice = "The activity record was updated successfully."
      redirect_to @activity
    else
      flash.now.alert = @activity.errors.full_messages.to_sentence
      render :edit
    end	
	
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:name, :score)
    end
	
	def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to users_path
	end	
end
