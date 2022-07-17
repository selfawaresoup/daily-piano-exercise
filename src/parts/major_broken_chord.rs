use lib::*;

pub struct MajorBrokenChord {
  root_note: Note
}

impl MajorBrokenChord {
  pub fn new(n: i32) -> MajorBrokenChord {
    let scale = Self::root_notes();
    let index: usize = (n as usize) % scale.len();
    let root_note = scale[index];
      MajorBrokenChord{root_note}
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

impl Part for MajorBrokenChord {
  fn title(&self) -> String {
      format!("Broken Chord: {} major", self.root_note.to_s())
  }

  fn short_name(&self) -> String {
      format!("{}maj", self.root_note.to_s())
  }
  
  fn notation_identifier(&self) -> String {
      format!("broken_chord_{}_major", self.root_note.to_name())
  }
}
