class CashFlow < ApplicationRecord
  has_many :cash_flow_categories
  has_many :categories, through: :cash_flow_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
