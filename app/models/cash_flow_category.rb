class CashFlowCategory < ApplicationRecord
  belongs_to :cash_flow
  belongs_to :category
end
