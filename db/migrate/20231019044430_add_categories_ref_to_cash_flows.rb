class AddCategoriesRefToCashFlows < ActiveRecord::Migration[7.0]
  def change
    add_reference :cash_flows, :categories, column: :category_id, foreign_key: true
  end
end
