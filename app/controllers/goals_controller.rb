class GoalsController < ApplicationController
  # Display a list of all goals
  def index
    @goals = current_user.goals
    @end_dates = current_user.goals.distinct.pluck(:end_date)
  end


  # Handle form submission to create a new goal
  def create
    puts goal_params
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goals_path, notice: "Goal was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update_status
    @goal = Goal.find(params[:id])
    if @goal.update(status: 'completed')
      # render json: { status: 'completed' }, status: :ok
      redirect_to goals_path
    else
      render json: { error: 'Failed to update' }, status: :unprocessable_entity
    end
  end 


  private

  # Strong parameters to whitelist the goal attributes
  def goal_params
    # Add user_id to params before permitting the other parameters
    params[:goal][:user_id] = current_user.id if current_user
    
    # Permit the parameters
    params.require(:goal).permit(:title, :goal_type, :end_date, :user_id)
  end  
end
