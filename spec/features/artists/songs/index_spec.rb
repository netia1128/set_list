require 'rails_helper'

RSpec.describe 'Artists songs index', type: :feature do
  before(:each) do
    @artist = Artist.create(name: "prince")
    @song_1 = @artist.songs.create!(title:  "I really like you",
                          length: 845,
                          play_count: 456789)
    @song_2 = Song.create!(title:  "I really like you too",
                          length: 664,
                          play_count: 45675589,
                          artist_id: @artist.id)
  end

  it 'shows all of the titles of the songs for the artist' do
    visit "/artists/#{@artist.id}/songs"

    expect(page).to have_content(@song_1.title)
    expect(page).to have_content(@song_2.title)
    expect(page).to have_content(@song_1.play_count)
    expect(page).to have_content(@song_2.play_count)
  end

  # it 'links to each songs show page' do
  #   visit "/artists/#{@artist.id}/songs"

  #   click_on @song_1.title
  #   save_and_open_page

  #   expect(current_path).to eq("/songs/#{@song_1.id}")
  # end


  it 'shows the averasge song length for the artist' do
    visit "/artists/#{@artist.id}/songs"
    save_and_open_page

    expect(page).to have_content("Average Song Length for prince 754.5")
  end
end