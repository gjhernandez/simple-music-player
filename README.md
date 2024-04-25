# Music player
A really simple music player simulation. It supports playing a single song or
multiple songs in sequence.

## Installation

```
bundle install
```

## Usage

```
bundle exec ruby main.rb
```

## Tests

```
bundle exec rspec
```

## Improvements since 0.0.0

- Improved overall readability (naming, well separated methods, etc).

- Classes are more easily extendable and conform to SRP (Single Responsibility
  Principle). For example, if it was needed to add support to other data sources
  for the songs list (i.e. a JSON file instead of a YAML file, or a performing
  a database query instead of an HTTP request). This has been extracted to the
  `songs_fetcher` and `songs_parser`.

- Similarly, a `player` class (e.g. Playlist or Song) has been introduced to
  handle playback logic. It expects any `playable` class to define `play` as
  instance class. That way both `playlist` and `song` can be played when passed
  to `player`.

## Future work

- Improve coverage:
  - Test main.rb
  - Test use cases
  - Test remaining entities

- Support multiple data sources. Fetcher is currently implementing all logic
  concerning making the HTTP request to get the song list. If the data source
  eventually changed to something else (like a database, for example), we would
  need to replace the whole fetcher to reflect that change. Instead, we should
  aim to have a generic "data access object" which knows how to interact with
  different types of data sources. Similar to the approach taken for parsing.

- Add command line options/arguments via rake.
