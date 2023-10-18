class RenameUsersRefToAuthorIdInCashFlows < ActiveRecord::Migration[7.0]
  def change
    rename_column(:cash_flows, :user_id, :author_id)
  end
end
