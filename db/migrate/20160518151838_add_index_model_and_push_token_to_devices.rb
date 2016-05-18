class AddIndexModelAndPushTokenToDevices < ActiveRecord::Migration[5.0]
  def change
    add_index :devices, [:model, :push_token], :unique => true
  end
end
