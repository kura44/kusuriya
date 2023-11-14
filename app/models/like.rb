class Like < ApplicationRecord
  belongs_to :maomao
  belongs_to :user
  validates_uniqueness_of :maomao_id, scope: :user_id
end
