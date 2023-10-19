require 'rails_helper'

RSpec.describe CashFlowCategory, type: :model do
  let(:user) do
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
  end
  let(:category) { Category.create(name: 'Shopping', icon: 'shopping-icon.jpg', user_id: user.id) }
  let(:cash_flow) { CashFlow.create(name: 'Clothing', amount: 30, author_id: user.id) }

  subject { CashFlowCategory.new(cash_flow_id: cash_flow.id, category_id: category.id) }

  before { subject.save }

  describe 'Association: ' do
    it 'belongs to cash_flow' do
      expect(subject).to respond_to(:cash_flow)
    end

    it 'belongs to category' do
      expect(subject).to respond_to(:category)
    end
  end
end
