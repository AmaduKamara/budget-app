# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    subject { User.new(name: 'Amkam', surname: 'Singh', email: 'amkam@example.com', password: 'test12345') }
    before { subject.save }

    it 'check that the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check that the surname is not blank' do
      subject.surname = nil
      expect(subject).to_not be_valid
    end

    it 'check that the email is not blank' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
