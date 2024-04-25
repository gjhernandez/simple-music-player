require_relative '../../entities/playlist'
require_relative '../../entities/song'

RSpec.describe Playlist do
  let(:songs) { [] }
  let(:shuffled) { false }
  let(:repeat) { false }
  let(:playlist) { described_class.new(songs: , shuffled: , repeat: ) }

  describe '#play' do
    subject { playlist.play }
    let(:played_songs) { [] }

    let(:songs) do
      %w[
        Song_1
        Song_2
        Song_3
        Song_4
        Song_5
      ].map{ |title| Song.new(title) }
    end

    before do
      allow_any_instance_of(Song).to receive(:play) do |song|
        played_songs << song
        playlist.stop if played_songs.size == songs.size * 2
      end

      subject
    end

    context 'when shuffled and repeat are disabled' do
      it 'calls #play on each song in the same order as given' do
        expect(played_songs).to eq(songs)
      end
    end

    context 'when shuffled is enabled' do
      let(:shuffled) { true }

      it 'calls #play on each song in a random order' do
        expect(played_songs).not_to eq(songs)
      end

      it 'calls #play on all songs' do
        expect(played_songs).to match_array(songs)
      end
    end

    fcontext 'when repeat is enabled' do
      let(:repeat) { true }

      it 'calls #play on all songs repeatedly in the same order as given' do
        expect(played_songs).to eq(songs * 2)
      end
    end
  end
end
