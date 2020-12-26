require "minitest/autorun"

require "./lib/exercise"
require "./lib/parts"
require "./lib/note"

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

describe Note do
  it "must return its string identifier" do
    _(Note.new(:C, :natural).to_s).must_equal "c"
    _(Note.new(:A, :flat).to_s).must_equal "a_flat"
    _(Note.new(:D, :sharp).to_s).must_equal "d_sharp"
  end

  it "must return its name" do
    _(Note.new(:C, :natural).name).must_equal "C"
    _(Note.new(:A, :flat).name).must_equal "A♭"
    _(Note.new(:D, :sharp).name).must_equal "D♯"
  end
end

describe MajorScale do
  it "must have the correct title" do
    _(MajorScale.from_number(0).title).must_equal "C major"
    _(MajorScale.from_number(12).title).must_equal "E♭ major"
    _(MajorScale.from_number(7).title).must_equal "F♯ major"
  end

  it "must have a string description" do
    _(MajorScale.from_number(0).description).must_be_kind_of String
  end

  it "must have a notation identifier" do
    _(MajorScale.from_number(0).notation_identifier).must_equal "scale_c_major"
    _(MajorScale.from_number(12).notation_identifier).must_equal "scale_e_flat_major"
    _(MajorScale.from_number(7).notation_identifier).must_equal "scale_f_sharp_major"
  end
end

describe MinorNaturalScale do
  it "must have the correct title" do
    _(MinorNaturalScale.from_number(0).title).must_equal "A minor"
    _(MinorNaturalScale.from_number(3).title).must_equal "F♯ minor"
    _(MinorNaturalScale.from_number(7).title).must_equal "E♭ minor"
  end

  it "must have a string description" do
    _(MinorNaturalScale.from_number(0).description).must_be_kind_of String
  end

  it "must have a notation identifier" do
    _(MinorNaturalScale.from_number(0).notation_identifier).must_equal "scale_a_minor_natural"
    _(MinorNaturalScale.from_number(3).notation_identifier).must_equal "scale_f_sharp_minor_natural"
    _(MinorNaturalScale.from_number(7).notation_identifier).must_equal "scale_e_flat_minor_natural"
  end
end

describe MinorHarmonicScale do
  it "must have the correct title" do
    _(MinorHarmonicScale.from_number(0).title).must_equal "A harmonic minor"
    _(MinorHarmonicScale.from_number(3).title).must_equal "F♯ harmonic minor"
    _(MinorHarmonicScale.from_number(7).title).must_equal "E♭ harmonic minor"
  end

  it "must have a string description" do
    _(MinorHarmonicScale.from_number(0).description).must_be_kind_of String
  end

  it "must have a notation identifier" do
    _(MinorHarmonicScale.from_number(0).notation_identifier).must_equal "scale_a_minor_harmonic"
    _(MinorHarmonicScale.from_number(3).notation_identifier).must_equal "scale_f_sharp_minor_harmonic"
    _(MinorHarmonicScale.from_number(7).notation_identifier).must_equal "scale_e_flat_minor_harmonic"
  end
end