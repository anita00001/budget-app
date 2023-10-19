require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.create(name: 'John Doe', email: 'john@example.com', password: 'password', confirmed_at: Time.now)
  end
  subject { Category.new(name: 'Shopping', icon: 'shopping-icon.jpg', user_id: user.id) }

  before { subject.save }

  describe 'Validation: ' do
    it 'Name is required' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Icon is required' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'User is required' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Association: ' do
    it 'belongs to user' do
      expect(subject).to respond_to(:user)
    end

    it 'has many cash_flow_categories' do
      expect(subject).to respond_to(:cash_flow_categories)
    end

    it 'has many cash_flows' do
      expect(subject).to respond_to(:cash_flows)
    end
  end
end
