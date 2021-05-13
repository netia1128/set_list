require 'rails_helper'

Rspec.describe 'songs index page', type: :feature do
  before(:each) do
    @artist = Artist.create(name: "CRJ")
    @song_1 = artists.songs.create!(title:  "I really like you",
                          length: 208,
                          play_count: 456789)
    @song_2 = Song.create!(title:  "I really like you",
                          length: 208,
                          play_count: 456789,
                          artist_id: artist.id)
  end

  it 'can see all song title and play count' do
    visit '/songs'

    expect(page).to have_content(@song_1.title)
    expect(page).to have_content(@song_2.title)
    expect(page).to have_content(@song_1.play_count)
    expect(page).to have_content(@song_2.play_count)
  end
end