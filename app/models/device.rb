class Device < ApplicationRecord
  belongs_to :user

  def self.find_or_create(user_id, os, model)
    self.find_or_create_by(user_id: user_id, os: os, model: model) do |device|
      device.user_id = user_id
      device.os = os
      device.model = model
    end
  end

end
