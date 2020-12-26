require "minitest/autorun"
require "./lib/note"

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
