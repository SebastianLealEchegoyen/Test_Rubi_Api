module Api
    module V1

        class TasksController < ApplicationController
        
            rescue_from ActiveRecord::RecordNotFound, :with => :task_not_found
        
            before_action :set_task, only: [:show, :update, :destroy]

            def index
            
              @tasks= Task.all


            end

            def show
              
            end

            def create
              @task = Task.new(task_params)
              if @task.save
                render 'show', status: 201
              else
                render :json => { :errors => @task.errors.full_messages }, status: 400
              end
            end

            def update
              if @task.update(task_params)
                render 'show', status: 200
              else
                render :json => { :errors => @task.errors.full_messages }, status: 400
              end
            end

            def destroy
              if @task.destroy
                render json: { message: "Product Successfully Deleted." }, status: 200
              else
                product_not_found
              end
            end
          

            def task_not_found 
                render json: {error: "Task not found."}, status: 404
            end

            def task_params
              params.require(:task).permit(:name, :dueDate, :completed)
            end

            def set_task
                @task = Task.find(params[:id])
            end
            

        end

    end
end