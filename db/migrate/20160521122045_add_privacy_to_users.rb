class AddPrivacyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :privacy, :string
  end
end
