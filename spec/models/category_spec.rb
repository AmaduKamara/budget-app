require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Category model' do
    user = User.create(name: 'Amkam', surname: 'WebAvenger', email: 'amkam@example.com', password: 'test12345')
    subject { Category.new(user_id: user, name: 'cars', icon: 'icon-link') }
    before { subject.save }

    it 'check that the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 20 characters' do
      subject.name = 'Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check that the icon is not blank' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'check if the icon is not exceeding 300 characters' do
      subject.icon = 'Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end
  end
end