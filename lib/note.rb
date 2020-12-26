class Note
  def initialize(symbol, accidental)
    @symbol = symbol
    @accidental = accidental
  end

  def to_s
    accidental_str = {
      natural: '',
      flat: '_flat',
      sharp: '_sharp'
    }[@accidental]

    @symbol.to_s.downcase + accidental_str
  end

  def name
    accidental_name = {
      natural: '',
      flat: '♭',
      sharp: '♯'
    }[@accidental]

    @symbol.to_s + accidental_name
  end
end
