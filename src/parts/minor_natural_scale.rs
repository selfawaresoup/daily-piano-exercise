use lib::*;

pub struct MinorNaturalScale {
  root_note: Note
}

impl MinorNaturalScale {
  pub fn new(n: i32) -> MinorNaturalScale {
    let scale = Self::root_notes();
    let index: usize = (n as usize) % scale.len();
    let root_note = scale[index];
    MinorNaturalScale{root_note}
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

impl Part for MinorNaturalScale {
  
  fn title(&self) -> String {
    format!("Scale: {} minor", self.root_note.to_s())
  }
  
  fn short_name(&self) -> String {
    format!("{}min", self.root_note.to_s())
  }
  
  fn notation_identifier(&self) -> String {
    format!("scale_{}_minor_natural", self.root_note.to_name())
  }
}

#[test]
fn test_minornaturalscale() {
  let scale = MinorNaturalScale::new(0);
  assert_eq!(scale.title(), "Scale: A minor")
}
