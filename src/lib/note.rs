#[derive(Copy, Clone)]
pub enum NoteName {
  A, B, C, D, E, F, G
}

impl NoteName {
    pub fn to_s(&self) -> &'static str {
        match self {
            NoteName::A => "A",
            NoteName::B => "B",
            NoteName::C => "C",
            NoteName::D => "D",
            NoteName::E => "E",
            NoteName::F => "F",
            NoteName::G => "G",
        }
    }

    pub fn to_name(&self) -> String {
        self.to_s().to_lowercase()
    }
}

#[derive(Copy, Clone)]
pub enum Accidental {
    Natural, Flat, Sharp
}

impl Accidental {
    pub fn to_s(&self) -> &'static str {
        match self {
            Accidental::Natural => "",
            Accidental::Sharp => "♯",
            Accidental::Flat => "♭",
        }
    }

    pub fn to_name(&self) -> &'static str {
        match self {
            Accidental::Natural => "",
            Accidental::Sharp => "_sharp",
            Accidental::Flat => "_flat",
        }
    }
}
  
#[derive(Copy, Clone)]
pub struct Note {
  name: NoteName,
  accidental: Accidental
}

impl Note {
    pub fn new(name: NoteName, accidental :Accidental) -> Note {
        Note{name, accidental}
    }

    pub fn to_s(&self) -> String {
        String::from(self.name.to_s()) + self.accidental.to_s()
    }
    pub fn to_name(&self) -> String {
        String::from(self.name.to_name()) + self.accidental.to_name()
    }
}

#[test]
fn test_note() {
    let note = Note::new(NoteName::A, Accidental::Sharp);
    assert_eq!(note.to_name(), "a_sharp");
    assert_eq!(note.to_s(), "A♯");

    let note = Note::new(NoteName::C, Accidental::Natural);
    assert_eq!(note.to_name(), "c");
    assert_eq!(note.to_s(), "C");

    let note = Note::new(NoteName::G, Accidental::Flat);
    assert_eq!(note.to_name(), "g_flat");
    assert_eq!(note.to_s(), "G♭");
}