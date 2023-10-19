require 'rails_helper'

RSpec.describe CashFlow, type: :model do
  let(:user) do
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
  end
  subject { CashFlow.new(name: 'Clothing', amount: 30, author_id: user.id) }

  before { subject.save }

  describe 'Validation: ' do
    it 'Name is required' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Amount is required' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'Amount is not valid: Should be greater than or equal to zero' do
      subject.amount = -1
      expect(subject).to_not be_valid
    end

    it 'Amount is not valid: Should be integer' do
      subject.amount = 'abcde'
      expect(subject).to_not be_valid
    end
  end

  describe 'Association: ' do
    it 'has many cash_flow_categories' do
      expect(subject).to respond_to(:cash_flow_categories)
    end

    it 'has many categories' do
      expect(subject).to respond_to(:categories)
    end
  end
end
