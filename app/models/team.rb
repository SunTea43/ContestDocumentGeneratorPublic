# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#  password   :string
#  room       :string
#
class Team < ApplicationRecord
    has_many :team_members, class_name: "TeamMember", foreign_key: "team_id", dependent: :destroy
end
