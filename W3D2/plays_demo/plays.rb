require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL
    raise "#{title} not in database" if play.empty?
    Play.new(play.first)
  end

  def self.find_by_playwright(name)
    plays = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = (
          SELECT
            id
          FROM
            playwrights
          WHERE
            playwrights.name = ?
        )
    SQL
    raise "No plays by #{name} in database" if plays.empty?
    plays.map { |datum| Play.new(datum) }
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright

  def initialize(options)
    @id = options['id']
    @name = options["name"]
    @birth_year = options["birth_year"]
  end

  def self.all
    playwrights = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    playwrights.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    playwright = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
    raise "#{name} not in database" if playwright.empty?
    Playwright.new(playwright.first)
  end

  def create
    raise "#{@name} is already in the database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{@name} is not in the database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    plays = PlayDBConnection.instance.execute(<<-SQL, @name)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = (
          SELECT
            id
          FROM
            playwrights
          WHERE
            playwrights.name = ?
        )
    SQL
    raise "#{@name} has no plays in the database" if plays.empty?
    plays.map { |datum| Play.new(datum) }
  end

end
