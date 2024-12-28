require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        email: 'test@example.com',
        password: 'password123'
      )
      expect(user).to be_valid
    end

    it 'requires an email' do
      user = User.new(password: 'password123')
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'requires a valid email format' do
      user = User.new(email: 'invalid_email', password: 'password123')
      user.valid?
      expect(user.errors[:email]).to include('is invalid')
    end

    it 'requires a unique email' do
      existing_user = User.create(email: 'test@example.com', password: 'password123')
      user = User.new(email: 'test@example.com', password: 'password123')
      user.valid?
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'requires a password' do
      user = User.new(email: 'test@example.com')
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'requires minimum password length' do
      user = User.new(email: 'test@example.com', password: '12345')
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end

  describe 'role' do
    it 'has default role of receptionist' do
      user = User.new
      expect(user.role).to eq('receptionist')
    end

    it 'can be set as doctor' do
      user = User.new(role: :doctor)
      expect(user.role).to eq('doctor')
    end

    it 'can be set as receptionist' do
      user = User.new(role: :receptionist)
      expect(user.role).to eq('receptionist')
    end
  end

  describe 'devise modules' do
    it 'includes expected devise modules' do
      expect(User.devise_modules).to include(
        :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :validatable
      )
    end
  end
end
