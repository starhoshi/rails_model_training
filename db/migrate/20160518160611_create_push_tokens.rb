class CreatePushTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :push_tokens do |t|
      t.references :user, foreign_key: true
      t.string :os
      t.string :push_token, :unique => true

      t.timestamps
    end
  end
end
