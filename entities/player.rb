class Player
  def initialize(playable)
    @playable = playable
  end

  def play
    playable.play
  rescue NoMethodError => e
    puts "#{playable.class} does not respond to #play"
  end

  attr_accessor :playable
end
