class CreateMaomaos < ActiveRecord::Migration[6.1]
  def change
    create_table :maomaos do |t|
      t.integer :userid
      t.integer :postid
      t.string :itemid1
      t.string :color1
      t.string :itemid2
      t.string :color2
      t.string :itemid3
      t.string :color3
      t.string :itemid4
      t.string :color4
      t.string :itemid5
      t.string :color5

      t.timestamps
    end
  end
end
