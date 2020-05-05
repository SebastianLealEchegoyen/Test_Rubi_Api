json.links do
    json.self api_v1_task_url(@task)
  end
  
  json.data do
    json.type "task"
    json.id @task.id
    json.attributes do
      json.name @task.name
      json.dueDate @task.dueDate
      json.completed @task.completed
    end
  end