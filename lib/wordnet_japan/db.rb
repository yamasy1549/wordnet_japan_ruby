require "active_record"

class WordNetJapan::DB
  DATABASE_FILENAME = "wnjpn.db"

  def self.connect(uri, options={})
    uri ||= DATABASE_FILENAME

    ActiveRecord::Base.establish_connection(
      adapter: "sqlite3",
      database: uri,
      **options
    )
  end
end
