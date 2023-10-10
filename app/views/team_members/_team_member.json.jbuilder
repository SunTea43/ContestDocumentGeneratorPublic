json.extract! team_member, :id, :name, :email, :team_id, :created_at, :updated_at
json.url team_member_url(team_member, format: :json)
