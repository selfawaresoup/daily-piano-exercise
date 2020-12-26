require "minitest/autorun"
require "./lib/exercise"

describe Exercise do
  describe "created with an index" do
    it "must report its index correctly" do
      _(Exercise.new(4).index).must_equal 4
    end
  end

  describe "created with a date" do
    it "must have the corrsponding index" do
      _(Exercise.by_date(Date.new(2020, 12, 24)).index).must_equal 24
    end
  end
end
