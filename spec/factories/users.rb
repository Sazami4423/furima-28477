
FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
      nickname                {Faker::Games::Pokemon.name}
      email                   {Faker::Internet.free_email}
      password = Faker::Internet.password(min_length: 6)
      password {password}
      password_confirmation   {password}
      surname                 {person.last.kanji}
      name                    {person.first.kanji}
      surname_kana            {person.last.katakana}
      name_kana               {person.first.katakana}
      birthday                {Faker::Date.in_date_period(month: 2)}
  end
end