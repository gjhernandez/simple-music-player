require_relative '../entities/song'
require_relative 'songs_base_parser'

require 'yaml'

class SongsYAMLParser < SongsBaseParser
  def parse
    songs.map{ |title| Song.new(title) }
  end

  def yaml_data
    YAML.load file_content
  end

  def songs
    yaml_data.fetch 'songs', []
  end
end
