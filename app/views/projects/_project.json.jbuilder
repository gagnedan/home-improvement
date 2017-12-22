json.extract! project, :id, :name, :description, :is_public, :estimated_effort, :actual_effort, :status
json.user do
  json.extract! project.user, :id, :first_name, :last_name
end
json.url project_url(project, format: :json)
