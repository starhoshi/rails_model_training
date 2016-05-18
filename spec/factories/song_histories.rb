FactoryGirl.define do
  factory :song_history do
    user nil
    song nil
    device nil
    media_id "MyString"
    track_source "MyString"
    album "MyString"
    duration 1
    genre "MyString"
    album_art_uri "MyString"
    track_number 1
    num_tracks 1
    recorded_at "2016-05-19"
    point ""
    accuracy 1.5
    altitude 1.5
    record_type "MyString"
  end
end
