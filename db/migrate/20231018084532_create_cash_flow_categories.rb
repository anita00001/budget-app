class CreateCashFlowCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :cash_flow_categories do |t|

      t.timestamps
    end
  end
end
