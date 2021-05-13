require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  before(:each) do
    @artist = Artist.create(name: "prince")
    @song_1 = @artist.songs.create!(title:  "I really like you",
                          length: 664,
                          play_count: 456789)
    @song_2 = Song.create!(title:  "I really like you too",
                          length: 1,
                          play_count: 45675589,
                          artist_id: @artist.id)
    @song_3 = Song.create!(title:  "Another song",
                            length: 845,
                            play_count: 456788589,
                            artist_id: @artist.id)
  end


  describe 'instance methods' do
    describe '#average_song_length' do
      it 'returns the aveage song length' do

        expect(@artist.average_song_length.round(2)).to eq(503.33)
      end
    end
  end
end