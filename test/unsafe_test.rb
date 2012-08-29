require 'test_helper'

class UnsafeTest < TestCase

  def test_safe_by_default
    obj1 = SafetyFirst.new
    obj1.username = 'me'
    obj1.save

    obj2 = SafetyFirst.new
    obj2.username = 'me'
    assert_raises(Mongo::OperationFailure) {obj2.save}
  end

  def test_unsafe_override
    obj1 = SeatOfMyPants.new
    obj1.username = 'me'
    obj1.save

    obj2 = SeatOfMyPants.new
    obj2.username = 'me'
    begin
      obj2.save
      pass
    rescue Mongo::OperationFailure
      flunk
    end
  end

  def test_force_unsafe
    obj1 = SafetyFirst.new
    obj1.username = 'me'
    obj1.save

    obj2 = SafetyFirst.new
    obj2.username = 'me'
    begin
      obj2.save :safe => false
      pass
    rescue Mongo::OperationFailure
      flunk
    end
  end
end

class SafetyFirst
  include MongoMapper::Document
  key :username, String
end
SafetyFirst.ensure_index :username, :unique => true

class SeatOfMyPants
  include MongoMapper::Document
  key :username, String
  unsafe
end
SeatOfMyPants.ensure_index :username, :unique => true
