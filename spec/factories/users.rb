module KanaConverter
  # カタカナをランダムに生成するメソッド
  def self.generate_katakana_name
    # カタカナの範囲でランダムに3文字生成
    ('ア'..'ン').to_a.sample(3).join
  end

  # 漢字、ひらがな、カタカナをランダムに生成するメソッド
  def self.generate_random_name
    name_type = ['kanji', 'hiragana', 'katakana'].sample # ランダムで名前タイプを決める
    case name_type
    when 'kanji'
      # 漢字の名前を生成（仮に適当な文字列としてランダムに生成）
      Faker::Japanese::Name.first_name
    when 'hiragana'
      # ひらがなの名前を生成
      ('あ'..'ん').to_a.sample(3).join
    when 'katakana'
      # カタカナの名前を生成
      ('ア'..'ン').to_a.sample(3).join
    end
  end
end

FactoryBot.define do
  factory :user do
    nickname { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    # 漢字、ひらがな、カタカナをランダムに生成してfirst_nameとlast_nameに代入
    first_name { KanaConverter.generate_random_name }
    last_name { KanaConverter.generate_random_name }

    # first_name_kana, last_name_kana はカタカナを生成
    first_name_kana { KanaConverter.generate_katakana_name }
    last_name_kana { KanaConverter.generate_katakana_name }

    birthday { Faker::Date.birthday(min_age: 0, max_age: 94).since(5.years.ago) }
  end
end