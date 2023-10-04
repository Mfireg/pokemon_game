require 'rails_helper'

RSpec.describe Character, type: :model do
  character = FactoryBot.create(:character)

  it 'is valid with a name with at least two letters' do
    expect(character).to be_valid
  end

  it 'raises a validation error for a name with less than two characters' do
    expect {
    FactoryBot.create(:character, :single_letter_name)
    }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Name is too short (minimum is 2 characters)')
  end

  it 'raises a validation error for an adult character (more than 16 years old)' do
    expect {
    FactoryBot.create(:character, :adult_character)
    }.to raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Age must be less or equal to 16.')
  end

  it 'raises a validation error for a character who has a gender that is not in [male, female]' do
    expect {
    FactoryBot.create(:character, :strange_gender)
    }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Gender must be 'male' or 'female'")
  end
end