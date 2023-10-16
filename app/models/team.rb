class Team < ApplicationRecord
    has_many :team_members, class_name: "TeamMember", foreign_key: "team_id", dependent: :destroy
end
