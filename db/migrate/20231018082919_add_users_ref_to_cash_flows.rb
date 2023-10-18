class AddUsersRefToCashFlows < ActiveRecord::Migration[7.0]
  def change
    add_reference :cash_flows, :user, null: false, foreign_key: true
  end
end
