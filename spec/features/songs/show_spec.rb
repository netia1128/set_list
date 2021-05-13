require 'rails_helper'

RSpec.describe 'songs show page', type: :feature do
  before(:each) do
    @artist = Artist.create!(name: "Your Mama")
    @song_1 = @artist.songs.create!(title:  "I really like you",
                          length: 208,
                          play_count: 456789)
    @song_2 = @artist.songs.create!(title:  "I really like you 2",
                          length: 208,
                          play_count: 456789)
  end

  it 'displays the song title' do
    visit "/songs/#{@song_1.id}"
    save_and_open_page
    expect(page).to have_content(@song_1.title)
    expect(page).to have_content(@artist.name)
    expect(page).to_not have_content(@song_2.title)
  end
end