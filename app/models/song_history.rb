class SongHistory < ApplicationRecord
  belongs_to :user
  belongs_to :song
  belongs_to :device
end
