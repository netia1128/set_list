# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@artist = Artist.create!(name: "prince")

@song_1 = @artist.songs.create!(title:  "I really like you",
                      length: 208,
                      play_count: 456789)
                      
@song_2 = Song.create!(title:  "I really like you too",
                      length: 2808,
                      play_count: 45675589,
                      artist_id: @artist.id)