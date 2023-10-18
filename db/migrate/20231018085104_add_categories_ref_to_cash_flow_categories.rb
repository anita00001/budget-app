class AddCategoriesRefToCashFlowCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :cash_flow_categories, :category, null: false, foreign_key: true
  end
end
