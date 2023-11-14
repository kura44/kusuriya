class AddUserIdToMaomaos < ActiveRecord::Migration[6.1]
  def change
    add_column :maomaos, :user_id, :integer
  end
end
