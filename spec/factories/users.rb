FactoryBot.define do
  factory :user do
        nickname              { Faker::Name.initials(number: 2) }
        email                 { Faker::Internet.email }
        password              { Faker::Internet.password(min_length: 6)+"t1" }
        password_confirmation { password }
        last_name             { Faker::Japanese::Name.last_name }
        first_name            { Faker::Japanese::Name.first_name }
        last_name_kana        { Faker::Japanese::Name.last_name.yomi }
        first_name_kana       { Faker::Japanese::Name.first_name.yomi }
  end
end
