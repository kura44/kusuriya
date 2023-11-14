class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  has_many :maomaos, dependent: :destroy
  #いいね機能
  has_many :likes, dependent: :destroy
  has_many :liked_maomaos, through: :likes, source: :maomao

  def already_liked?(maomao)
    self.likes.exists?(maomao_id: maomao.id)
  end
end
