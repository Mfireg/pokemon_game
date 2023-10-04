class Character < ApplicationRecord
    validates :name, presence: true, length: { minimum: 2 }
    validates :age, numericality: { less_than_or_equal_to: 16, message: "must be less or equal to 16." }
    validates :gender, inclusion: { in: %w(male female), message: "must be 'male' or 'female'" }
end
