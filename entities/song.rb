class Song
  def initialize(title)
    @title = title
  end

  def play
    puts title
    sleep 1
  end

  attr_accessor :title
end
