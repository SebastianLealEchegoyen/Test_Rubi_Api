class Api::V1::TasksController < ApplicationController
        
            rescue_from ActiveRecord::RecordNotFound, :with => :task_not_found
            before_action :authenticate_request!, except: [:index]
            before_action :load_current_user!, only: [:create, :destroy]
            before_action :set_task, only: [:show, :update, :destroy]

            def index
            
              @tasks= Task.all


            end

            def show
              
            end

            def create

            if @current_user.isAdmin?

              @task = Task.new(task_params)
              if @task.save
                render 'show', status: 201
              else
                render :json => { :errors => @task.errors.full_messages }, status: 400
              end
            else
              render json: {error: "Unauthorized: You must be an admin to perform that action"}, status: :unauthorized
            end
          end

            def update
            if @current_user.isAdmin?
              if @task.update(task_params)
                render 'show', status: 200
              else
                render :json => { :errors => @task.errors.full_messages }, status: 400
              end
            else
              render json: {error: "Unauthorized: You must be an admin to perform that action"}, status: :unauthorized
            end
          end

            def destroy
              if @current_user.isAdmin?

              if @task.destroy
                render json: { message: "Product Successfully Deleted." }, status: 200
              else
                product_not_found
              end
            else
              render json: {error: "Unauthorized: You must be an admin to perform that action"}, status: :unauthorized
            end
          end
          
          private

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

