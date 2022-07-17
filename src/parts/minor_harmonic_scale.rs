use lib::*;

pub struct MinorHarmonicScale {
  root_note: Note
}

impl MinorHarmonicScale {
  pub fn new(n: i32) -> MinorHarmonicScale {
    let scale = Self::root_notes();
    let index: usize = (n as usize) % scale.len();
    let root_note = scale[index];
    MinorHarmonicScale{root_note}
  }
  
  fn root_notes() -> Scale {
    vec![
      Note::new( NoteName::A, Accidental::Natural ),
      Note::new( NoteName::E, Accidental::Natural ),
      Note::new( NoteName::B, Accidental::Natural ),
      Note::new( NoteName::F, Accidental::Sharp ),
      Note::new( NoteName::C, Accidental::Sharp ),
      Note::new( NoteName::G, Accidental::Sharp ),
      Note::new( NoteName::D, Accidental::Sharp ),
      Note::new( NoteName::E, Accidental::Flat ),
      Note::new( NoteName::B, Accidental::Flat ),
      Note::new( NoteName::F, Accidental::Natural ),
      Note::new( NoteName::C, Accidental::Natural ),
      Note::new( NoteName::G, Accidental::Natural ),
      Note::new( NoteName::D, Accidental::Natural ),
    ]
  }
}

impl Part for MinorHarmonicScale {
  
  fn title(&self) -> String {
    format!("Scale: {} harmonic minor", self.root_note.to_s())
  }
  
  fn short_name(&self) -> String {
    format!("{}hmin", self.root_note.to_s())
  }
  
  fn notation_identifier(&self) -> String {
    format!("scale_{}_minor_harmonic", self.root_note.to_name())
  }
}
