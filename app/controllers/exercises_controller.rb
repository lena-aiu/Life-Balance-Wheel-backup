class ExercisesController < ApplicationController
	before_action :set_activity 

	def create
		@exercise = @activity.exercises.create(exercise_params)
		redirect_to @activity
	end
	
	def edit
		@exercise = Exercise.find(params[:id])
	end
	
	def update
		@exercise = Exercise.find(params[:id])
		@exercise.update(exercise_params)
		redirect_to @activity
	end
	
	def destroy
		@exercise = Exercise.find(params[:id])
		@exercise.destroy
		redirect_to @activity
	end
	
	private
	def exercise_params
		params.require(:exercise).permit(:name, :content)
	end
	
	def set_activity
		@activity = Activity.find(params[:activity_id])
	end
end
