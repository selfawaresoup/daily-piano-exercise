require 'date'
#require 'random'
require './lib/parts'

class Exercise
  attr_reader :index, :parts
  START_DATE = Date.new(2020, 11, 30)

  def initialize(index)
    @index = index
    populate
  end

  def self.by_date(date)
    index = (date - START_DATE).to_i
    self.new index
  end

  def date
    START_DATE + index
  end

  private

  def populate
    rnd = Random.new(@index)
    @parts = [
      MajorScale.from_number(rnd.rand(15)),
      MinorNaturalScale.from_number(rnd.rand(12)),
      MinorHarmonicScale.from_number(rnd.rand(12)),
      MajorBrokenChord.from_number(rnd.rand(12)),
      MinorBrokenChord.from_number(rnd.rand(12)),
    ]
  end
end