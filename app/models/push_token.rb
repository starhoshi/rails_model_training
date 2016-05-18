class PushToken < ApplicationRecord
  belongs_to :user
  validates :push_token, uniqueness: true
end
