class AddUsernameToTeam < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :username, :string
    add_column :teams, :password, :string
  end
end
