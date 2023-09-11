class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :prototype_title
      t.string :prototype_catch_copy
      t.string :prototype_concept
      t.timestamps
    end
  end
end
