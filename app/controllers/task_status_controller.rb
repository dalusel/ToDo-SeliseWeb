class TaskStatusController < ApplicationController
  before_action :set_taskstatus, only: [:show, :edit, :update, :destroy,:delete]
  def new
    @taskstatus = MyTask.new
  end

  def create
    @taskstatus = MyTask.new(taskstatus_params)
    @taskstatus.status = false
    respond_to do |format|
      if @taskstatus.save
        format.html { redirect_to task_status_index_path, notice: 'Task Status was successfully created.' }
        format.json { render :show, status: :created, location: @taskstatus }
      else
        format.html { render :new }
        format.json { render json: @taskstatus.errors, status: :unprocessable_entity }
      end
    end
  end

   def update    
    respond_to do |format|
        format.html { redirect_to task_status_index_path, notice: 'Task Status was successfully updated.' }
        format.json { render :index, status: :ok, location: @taskstatus }   
    end
  end

  def edit
  end

  def delete
  end

  def destroy
   redirect_to(:action=>'index')
  end

  def show
  end

  def index
    if params[:mySubmit]
      set_taskstatus
    else
      set_default_data
      @pendingTask = MyTask.where(status:false).order("meridiem,tasktime")
      @completedTask = MyTask.where(status:true).order("meridiem,tasktime")     
      addReminder
    end
  end

  private
  def taskstatus_params
    params.require(:my_task).permit(:task,:status,:tasktime,:meridiem)
  end

  private
  def taskstatus_params_forupdate
    params.require(:taskstatus).permit(:task,:status,:tasktime,:meridiem)
  end

  private
  def set_taskstatus #negate status if user clicks checkbox
    @taskstatus = MyTask.find(params[:TaskID])
    status = false
    if @taskstatus.status == false
        status = true
    end
    @taskstatus.update_attribute("status",status)
  end

  def set_default_data #update all task to pending for a new day
    to_day = Date.today.to_date.to_s
    lastdate = TaskDate.where("taskdate like ?","%#{to_day}%")
    all_task = MyTask.all
    if all_task.size == 0
       @taskstatus = MyTask.new
       @taskstatus.update_attributes(task: "Eat Breakfast",tasktime:7,meridiem:"AM",status:false)
       @taskstatus = MyTask.new
       @taskstatus.update_attributes(task: "Eat Lunch",tasktime:1,meridiem:"PM",status:false)
       @taskstatus = MyTask.new
       @taskstatus.update_attributes(task: "Eat Dinner",tasktime:9,meridiem:"PM",status:false)
    end
    if lastdate.size < 1      
      all_task.each do |item|
        item.update_attributes(status: false)
      end
      task_date_obj = TaskDate.new
      task_date_obj.taskdate = to_day
      task_date_obj.save
    end
  end

  def addReminder #if current time is greater than task time, add reminder
    curTime = DateTime.now.to_s(:time)
    curTime= curTime.to_f
    @pendingTask.each do |item|
        actualTIme = item.tasktime
        if item.meridiem == "PM"
          actualTIme = item.tasktime + 12
        end
        if curTime > actualTIme.to_f
          myReminder = "#{item.task} before #{item.tasktime} : #{item.meridiem}"
          item.reminder = myReminder
          myReminder =" "
        end
    end
  end
end
