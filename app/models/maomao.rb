class Maomao < ApplicationRecord
    #ユーザーに属する
    belongs_to :user

    #いいね機能
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
end
