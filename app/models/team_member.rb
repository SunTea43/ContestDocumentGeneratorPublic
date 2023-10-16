class TeamMember < ApplicationRecord
  belongs_to :team, dependent: :destroy
end
