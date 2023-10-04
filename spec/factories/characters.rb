FactoryBot.define do
    factory :character do
      name { "John Doe" }
      age { 15 }
      gender { 'male' }

      trait :single_letter_name do
        name { 'A' }
      end

      trait :adult_character do
        age { 21 }
      end

      trait :strange_gender do
        gender { "something strange" }
      end
    end
  end