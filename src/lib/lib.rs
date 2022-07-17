mod note;
pub use note::*;

pub type Scale = Vec<Note>;

pub trait Part {
  fn title(&self) -> String;
  fn notation_identifier(&self) -> String;
  fn short_name(&self) -> String;
}
