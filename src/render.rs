use tera::{Tera, Context};
use lazy_static::lazy_static;
use super::exercise::Exercise;
use serde::Serialize;
use serde_json;

lazy_static! {
  pub static ref TEMPLATES: Tera = {
    let mut tera = match Tera::new("src/templates/**/*.html") {
      Ok(t) => t,
      Err(e) => {
        println!("Template paring error(s): {}", e);
        ::std::process::exit(1);
      }
    };
    tera.autoescape_on(vec!["html"]);
    tera
  };
}

#[derive(Serialize)]
struct PartTemplateData {
  title: String,
  short_name: String,
  notation_identifier: String
}

#[derive(Serialize)]
struct ExerciseTemplateData {
  index: i32,
  date: String,
  parts: Vec<PartTemplateData>
}

fn exercise_template_data(exercise: &Exercise) -> ExerciseTemplateData {
  let index = exercise.index;
  let date = exercise.date().format("%Y-%m-%d").to_string();
  let mut parts: Vec<PartTemplateData> = vec![];

  for p in &exercise.parts {
    let title = p.title();
    let short_name = p.short_name();
    let notation_identifier = p.notation_identifier();
    parts.push(PartTemplateData{title, short_name, notation_identifier});
  }

  ExerciseTemplateData{index, date, parts}
}

pub fn render_index(exercises: &Vec<Exercise>) -> String {
  
  let mut data: Vec<ExerciseTemplateData> = vec![];

  for ex in exercises {
    data.push(exercise_template_data(&ex));
  }

  let json = serde_json::to_string(&data).unwrap();

  let mut ctx = Context::new();
  ctx.insert("exercises", &json);

  let out = TEMPLATES.render("index.html", &ctx);


  let html = match out {
    Ok(str) => str,
    Err(e) => {
      println!("render error(s): {}", e);
      ::std::process::exit(1);
    }
  };

  html
}

pub fn render_exercise(exercise: &Exercise) -> String {

  let data = exercise_template_data(&exercise);
  let mut ctx = Context::new();
  ctx.insert("exercise", &data);

  let out = TEMPLATES.render("exercise.html", &ctx);

  let html = match out {
    Ok(str) => str,
    Err(e) => {
      println!("render error(s): {}", e);
      ::std::process::exit(1);
    }
  };

  html
}