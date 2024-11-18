module KanaConverter
  def self.generate_katakana_name
    ('ア'..'ン').to_a.sample(3).join
  end

  def self.generate_random_name
    name_type = %w[kanji hiragana katakana].sample
    case name_type
    when 'kanji'
      Faker::Japanese::Name.first_name
    when 'hiragana'
      ('あ'..'ん').to_a.sample(3).join
    when 'katakana'
      ('ア'..'ン').to_a.sample(3).join
    end
  end
end

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { KanaConverter.generate_random_name }
    last_name { KanaConverter.generate_random_name }
    first_name_kana { KanaConverter.generate_katakana_name }
    last_name_kana { KanaConverter.generate_katakana_name }
    birthday { Faker::Date.birthday(min_age: 0, max_age: 94).since(5.years.ago) }
  end
end
