require_relative 'songs_yaml_parser'

class SongsParser
  def initialize(file_content, parser = SongsYAMLParser)
    @file_content = file_content
    @parser = parser
  end

  def parse
    parser.new(file_content).parse
  end

  attr_reader :file_content, :parser
end
