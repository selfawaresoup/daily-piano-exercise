require "minitest/autorun"

require "./lib/parts"
require "./lib/note"

describe MajorScale do
  it "must have the correct title" do
    _(MajorScale.from_number(0).title).must_equal "Scale: C major"
    _(MajorScale.from_number(12).title).must_equal "Scale: E♭ major"
    _(MajorScale.from_number(7).title).must_equal "Scale: F♯ major"
  end

  it "must have a notation identifier" do
    _(MajorScale.from_number(0).notation_identifier).must_equal "scale_c_major"
    _(MajorScale.from_number(12).notation_identifier).must_equal "scale_e_flat_major"
    _(MajorScale.from_number(7).notation_identifier).must_equal "scale_f_sharp_major"
  end
end

describe MinorNaturalScale do
  it "must have the correct title" do
    _(MinorNaturalScale.from_number(0).title).must_equal "Scale: A minor"
    _(MinorNaturalScale.from_number(3).title).must_equal "Scale: F♯ minor"
    _(MinorNaturalScale.from_number(7).title).must_equal "Scale: E♭ minor"
  end

  it "must have a notation identifier" do
    _(MinorNaturalScale.from_number(0).notation_identifier).must_equal "scale_a_minor_natural"
    _(MinorNaturalScale.from_number(3).notation_identifier).must_equal "scale_f_sharp_minor_natural"
    _(MinorNaturalScale.from_number(7).notation_identifier).must_equal "scale_e_flat_minor_natural"
  end
end

describe MinorHarmonicScale do
  it "must have the correct title" do
    _(MinorHarmonicScale.from_number(0).title).must_equal "Scale: A harmonic minor"
    _(MinorHarmonicScale.from_number(3).title).must_equal "Scale: F♯ harmonic minor"
    _(MinorHarmonicScale.from_number(7).title).must_equal "Scale: E♭ harmonic minor"
  end

  it "must have a notation identifier" do
    _(MinorHarmonicScale.from_number(0).notation_identifier).must_equal "scale_a_minor_harmonic"
    _(MinorHarmonicScale.from_number(3).notation_identifier).must_equal "scale_f_sharp_minor_harmonic"
    _(MinorHarmonicScale.from_number(7).notation_identifier).must_equal "scale_e_flat_minor_harmonic"
  end
end

describe MajorBrokenChord do
  it "must have the correct title" do
    _(MajorBrokenChord.from_number(0).title).must_equal "Broken Chord: C major"
    _(MajorBrokenChord.from_number(3).title).must_equal "Broken Chord: D♯ major"
    _(MajorBrokenChord.from_number(7).title).must_equal "Broken Chord: G major"
  end

  it "must have a notation identifier" do
    _(MajorBrokenChord.from_number(0).notation_identifier).must_equal "broken_chord_c_major"
    _(MajorBrokenChord.from_number(3).notation_identifier).must_equal "broken_chord_d_sharp_major"
    _(MajorBrokenChord.from_number(7).notation_identifier).must_equal "broken_chord_g_major"
  end
end
