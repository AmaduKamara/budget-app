# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Expense model' do
    user = User.create(name: 'Amadu', surname: 'Kamara', email: 'amkam@example.com', password: 'test12345')
    subject { Expense.new(user_id: user, name: 'food', amount: 120) }
    before { subject.save }

    it 'check that the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 20 characters' do
      subject.name = 'Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check that the amount is not blank' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'check if amount is numeric' do
      subject.amount = 'not-numeric'
      expect(subject).to_not be_valid
    end

    it 'check if price is equal or greater than one' do
      expect(subject.amount).to be >= 1
    end
  end
end
