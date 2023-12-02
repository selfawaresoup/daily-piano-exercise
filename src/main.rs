mod exercise;
mod parts;
mod render;
use render::*;
use exercise::*;
use std::fs;
use include_dir::{include_dir, Dir};
use std::path::Path;

extern crate tera;
extern crate lazy_static;
extern crate serde;
extern crate serde_json;

const EXERCISE_COUNT: i32 = 2000;

fn main() {
  let mut exercises: Vec<Exercise> = vec![];

  for i in 1..EXERCISE_COUNT {
    exercises.push(Exercise::new(i));
  }

  let out_path = Path::new("./output");

  fs::create_dir_all(out_path.join("exercise")).unwrap();

  fs::write(out_path.join("index.html"), render_index(&exercises)).unwrap();

  for (i, exercise) in exercises.iter().enumerate() {
    let ex_path = out_path.join(format!("exercise/{}", i + 1));
    fs::create_dir_all(&ex_path).unwrap();
    fs::write(ex_path.join("index.html"), render_exercise(&exercise)).unwrap();
  }

  write_resources();
}

const RESOURCE_DIR: Dir = include_dir!("src/resources");

fn write_resources() {
  let out_path = Path::new("./output");
  fs::create_dir_all(out_path.join("notation")).unwrap();

  let icon = RESOURCE_DIR.get_file("icon.png").unwrap();
  fs::write(out_path.join("icon.png"), icon.contents()).unwrap();

  let css = RESOURCE_DIR.get_file("style.css").unwrap();
  fs::write(out_path.join("style.css"), css.contents()).unwrap();

  let js = RESOURCE_DIR.get_file("main.js").unwrap();
  fs::write(out_path.join("main.js"), js.contents()).unwrap();

  let svg_dir = RESOURCE_DIR.get_dir("notation").unwrap();

  for svg in svg_dir.files() {
    let path = out_path.join(svg.path());
    fs::write(path, svg.contents()).unwrap();
  }
}
