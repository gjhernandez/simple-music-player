class Playlist

  attr_accessor :songs, :shuffled, :repeat, :original_songs, :stopped

  def initialize(songs: [], shuffled: false, repeat: false)
    @original_songs = songs.dup
    @songs = songs.dup
    @shuffled = shuffled
    @repeat = repeat
    @stopped = true
    shuffle! if shuffled?
  end

  alias repeat? repeat
  alias shuffled? shuffled
  alias stopped? stopped

  def play
    @stopped = false
    while (size >= 0 && !stopped?) do
      if size == 0
        if repeat?
          reset
        else
          break
        end
      end
      next_song.play
    end
  end

  def stop
    @stopped = true
  end

  def add_songs(new_songs)
    @original_songs.push(*new_songs)
    @songs.push(*new_songs)
    shuffle! if shuffled?
  end

  def shuffle!
    @songs.shuffle!
    @shuffled = true
  end

  def disable_shuffle!
    @songs = @original_songs.dup
    @shuffled = false
  end

  def repeat!
    @repeat = true
  end

  def disable_repeat!
    @repeat = false
  end

  def next_song
    songs.shift
  end

  def size
    songs.size
  end

  private

  def reset
    add_songs(@original_songs.dup)
  end
end
