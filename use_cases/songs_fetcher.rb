require 'open-uri'

require_relative 'songs_parser'

class SongsFetcher
  SOURCE_URL = 'https://gist.githubusercontent.com/' \
    'isabel22/e5ad5c47046a657a94dbed0bc8dd4bbb/' \
    'raw/dde2f2a5c0afbf262a93ef4c84d17d3cadaa372a/' \
    'songs.yml'.freeze

  def initialize(source_url = SOURCE_URL, parser = SongsParser)
    @source_url = source_url
    @parser = parser
  end

  def fetch
    parser.new(file_content).parse
  end

  def file_content
    response = URI.open(source_url)
    response.read
  rescue => e
    case e.class
    when OpenURI::HTTPError
      puts "HTTP Error: #{e.message}"
    when Errno::ENOENT
      puts "File not found: #{e.message}"
    when Errno::ECONNREFUSED
      puts "Connection refused: #{e.message}"
    else
      puts "An unexpected error occurred: #{e.message}"
    end
  end

  attr_reader :source_url, :parser
end
