class CreateControllers < ActiveRecord::Migration[5.0]
  def change
    create_table :controllers do |t|
      t.string :me

      t.timestamps
    end
  end
end
