class AddRoomToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :room, :string
  end
end
