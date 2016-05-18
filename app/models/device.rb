class Device < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :model, :scope => :push_token
end
