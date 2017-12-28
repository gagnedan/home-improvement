json.extract! comment, :id, :body
json.user do
  json.extract! comment.user, :id, :first_name, :last_name
end