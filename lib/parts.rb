require "./lib/note"

class Part
  attr_reader :title, :notation_identifier, :description
end

class MajorScale < Part
  ROOT_NOTES = [
    Note.new(:C, :natural),
    Note.new(:G, :natural),
    Note.new(:D, :natural),
    Note.new(:A, :natural),
    Note.new(:E, :natural),
    Note.new(:B, :natural),
    Note.new(:C, :flat),
    Note.new(:F, :sharp),
    Note.new(:G, :flat),
    Note.new(:D, :flat),
    Note.new(:C, :sharp),
    Note.new(:A, :flat),
    Note.new(:E, :flat),
    Note.new(:B, :flat),
    Note.new(:F, :natural),
  ]

  def initialize(root_note)
    @root_note = root_note
  end

  def title
    "Scale: #{@root_note.name} major"
  end

  def notation_identifier
    "scale_#{@root_note.to_s}_major".downcase
  end

  def self.from_number(n)
    root = self::ROOT_NOTES[n % self::ROOT_NOTES.length]
    self.new(root)
  end
end

class MinorNaturalScale < Part
  ROOT_NOTES = [
    Note.new(:A, :natural),
    Note.new(:E, :natural),
    Note.new(:B, :natural),
    Note.new(:F, :sharp),
    Note.new(:C, :sharp),
    Note.new(:G, :sharp),
    Note.new(:D, :sharp),
    Note.new(:E, :flat),
    Note.new(:B, :flat),
    Note.new(:F, :natural),
    Note.new(:C, :natural),
    Note.new(:G, :natural),
    Note.new(:D, :natural),
  ]

  def initialize(root_note)
    @root_note = root_note
  end

  def title
    "Scale: #{@root_note.name} minor"
  end

  def notation_identifier
    "scale_#{@root_note.to_s}_minor_natural".downcase
  end

  def self.from_number(n)
    root = self::ROOT_NOTES[n % self::ROOT_NOTES.length]
    self.new(root)
  end
end

class MinorHarmonicScale < MinorNaturalScale
  def title
    "Scale: #{@root_note.name} harmonic minor"
  end

  def notation_identifier
    "scale_#{@root_note.to_s}_minor_harmonic".downcase
  end
end

class MajorBrokenChord < Part
  ROOT_NOTES = [
    Note.new(:C, :natural),
    Note.new(:C, :sharp),
    Note.new(:D, :natural),
    Note.new(:D, :sharp),
    Note.new(:E, :natural),
    Note.new(:F, :natural),
    Note.new(:F, :sharp),
    Note.new(:G, :natural),
    Note.new(:G, :sharp),
    Note.new(:A, :natural),
    Note.new(:A, :sharp),
    Note.new(:B, :natural),
  ]

  def initialize(root_note)
    @root_note = root_note
  end

  def title
    "Broken Chord: #{@root_note.name} major"
  end

  def notation_identifier
    "broken_chord_#{@root_note.to_s}_major".downcase
  end

  def self.from_number(n)
    root = self::ROOT_NOTES[n % self::ROOT_NOTES.length]
    self.new(root)
  end
end
