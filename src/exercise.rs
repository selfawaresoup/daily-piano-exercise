use lib::*;
use super::parts::*;

use chrono::prelude::*;
use chrono::Duration;

pub struct Exercise {
  pub index: i32,
  pub parts: [Box<dyn Part>; 5]
}

impl Exercise {
  pub fn new(n: i32) -> Exercise {
    Exercise{
      index: n,
      parts: [
        Box::new(MajorScale::new(n)),
        Box::new(MinorNaturalScale::new(n)),
        Box::new(MinorHarmonicScale::new(n)),
        Box::new(MajorBrokenChord::new(n)),
        Box::new(MinorBrokenChord::new(n))
      ]
    }   
  }

  pub fn date(&self) -> Date<Utc> {
    Utc.ymd(2020, 11,30) + Duration::days(self.index as i64)
  }
}
