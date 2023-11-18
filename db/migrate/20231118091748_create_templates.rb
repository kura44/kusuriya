class CreateTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :templates do |t|
      t.string :name
      t.string :image
      t.integer :template_id

      t.timestamps
    end
  end
end
