use lib::*;

pub struct MinorBrokenChord {
  root_note: Note
}

impl MinorBrokenChord {
  pub fn new(n: i32) -> MinorBrokenChord {
    let scale = Self::root_notes();
    let index: usize = (n as usize) % scale.len();
    let root_note = scale[index];
    MinorBrokenChord{root_note}
  }
  
  fn root_notes() -> Scale {
    vec![
      Note::new( NoteName::C, Accidental::Natural ),
      Note::new( NoteName::C, Accidental::Sharp ),
      Note::new( NoteName::D, Accidental::Natural ),
      Note::new( NoteName::D, Accidental::Sharp ),
      Note::new( NoteName::E, Accidental::Natural ),
      Note::new( NoteName::F, Accidental::Natural ),
      Note::new( NoteName::F, Accidental::Sharp ),
      Note::new( NoteName::G, Accidental::Natural ),
      Note::new( NoteName::G, Accidental::Sharp ),
      Note::new( NoteName::A, Accidental::Natural ),
      Note::new( NoteName::A, Accidental::Sharp ),
      Note::new( NoteName::B, Accidental::Natural ),
    ]
  }
}

impl Part for MinorBrokenChord {
  
  
  fn title(&self) -> String {
    format!("Broken Chord: {} minor", self.root_note.to_s())
  }
  
  fn short_name(&self) -> String {
    format!("{}min", self.root_note.to_s())
  }
  
  fn notation_identifier(&self) -> String {
    format!("broken_chord_{}_minor", self.root_note.to_name())
  }
}