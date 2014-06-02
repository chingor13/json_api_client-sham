require 'test_helper'

class Question < JsonApiClient::Sham::Data
  self.fixture_path = File.expand_path("../data", __FILE__)
end

class NoPath < JsonApiClient::Sham::Data
end

class DataTest < Minitest::Test

  def test_can_find_one_by_id
    record = Question.find(1)
    assert record
  end

  def test_can_find_one_by_fixture_name
    record = Question.find("one")
    assert record
  end

  def test_can_find_one_by_specified_parameter
    record = Question.find("How do I find a lawyer?", :subject)
    assert record
  end

  def test_unspecified_path_raises_exception
    assert_raises Errno::ENOENT do
      NoPath.find(1)
    end
  end

  def test_all
    records = Question.all
    assert records.is_a?(Array)
    assert_equal 2, records.length
  end

end