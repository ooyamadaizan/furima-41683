class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname, presence: true
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :first_name_kana, presence: true
         validates :last_name_kana, presence: true
         validates :birthday, presence: true
         validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*[0-9])/ , message: "は半角英数字を含めてください" }
         validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
         validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "は全角（漢字・ひらがな・カタカナ）で入力してください" }
         validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角（カタカナ）で入力してください" }
         validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: "は全角（カタカナ）で入力してください" }
end
