class SongsBaseParser
  def initialize(file_content)
    @file_content = file_content
  end

  def parse
    raise NotImplementedError, "#{self.class} has not implemented method #{__method__}"
  end

  attr_reader :file_content
end
