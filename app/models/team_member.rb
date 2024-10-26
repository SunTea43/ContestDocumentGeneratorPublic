# == Schema Information
#
# Table name: team_members
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  team_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TeamMember < ApplicationRecord
  belongs_to :team, dependent: :destroy
end
