FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    japanese_user = Gimei.name
    first_name { japanese_user.first.kanji }
    first_name_kana { japanese_user.first.katakana }
    family_name { japanese_user.last.kanji }
    family_name_kana { japanese_user.last.katakana }
    birthday {Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end