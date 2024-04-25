require_relative 'use_cases/songs_fetcher'
require_relative 'entities/player'
require_relative 'entities/playlist'

songs = SongsFetcher.new.fetch
playlist = Playlist.new(songs:, shuffled: true, repeat: true)
Player.new(playlist).play
