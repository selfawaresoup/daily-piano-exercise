use lib::*;

pub struct MajorScale {
  root_note: Note
}

impl MajorScale {
  pub fn new(n: i32) -> MajorScale {
    let scale = Self::root_notes();
    let index: usize = (n as usize) % scale.len();
    let root_note = scale[index];
    MajorScale{root_note}
  }
  
  fn root_notes() -> Scale {
    vec![
      Note::new( NoteName::C, Accidental::Natural ),
      Note::new( NoteName::G, Accidental::Natural ),
      Note::new( NoteName::D, Accidental::Natural ),
      Note::new( NoteName::A, Accidental::Natural ),
      Note::new( NoteName::E, Accidental::Natural ),
      Note::new( NoteName::B, Accidental::Natural ),
      Note::new( NoteName::C, Accidental::Flat ),
      Note::new( NoteName::F, Accidental::Sharp ),
      Note::new( NoteName::G, Accidental::Flat ),
      Note::new( NoteName::D, Accidental::Flat ),
      Note::new( NoteName::C, Accidental::Sharp ),
      Note::new( NoteName::A, Accidental::Flat ),
      Note::new( NoteName::E, Accidental::Flat ),
      Note::new( NoteName::B, Accidental::Flat ),
      Note::new( NoteName::F, Accidental::Natural ),
    ]
  }
}

impl Part for MajorScale {
  
  
  fn title(&self) -> String {
    format!("Scale: {} major", self.root_note.to_s())
  }
  
  fn short_name(&self) -> String {
    format!("{}maj", self.root_note.to_s())
  }
  
  fn notation_identifier(&self) -> String {
    format!("scale_{}_major", self.root_note.to_name())
  }
}

#[test]
fn test_majorscale() {
  let scale = MajorScale::new(0);
  assert_eq!(scale.title(), "Scale: C major")
}
