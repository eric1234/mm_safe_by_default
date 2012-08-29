require 'minitest/autorun'

require 'bundler/setup'
require 'database_cleaner'

require 'mm_safe_by_default'

MongoMapper.connection = Mongo::Connection.new \
  (ENV['MM_HOST'] || 'localhost'), (ENV['MM_PORT'] || 27017)
MongoMapper.database = ENV['MM_DATABSE'] || 'mm_safe_by_default'
DatabaseCleaner.strategy = :truncation

class TestCase < MiniTest::Unit::TestCase

  def setup
    DatabaseCleaner.start
    super
  end

  def teardown
    DatabaseCleaner.clean
    super
  end

end
