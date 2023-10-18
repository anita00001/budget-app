class Category < ApplicationRecord
  belongs_to :user
  has_many :cash_flow_categories
  has_many :cash_flows, through: :cash_flow_categories

  validates :name, presence: true
  validates :icon, presence: true
end
