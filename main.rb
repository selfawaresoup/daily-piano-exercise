require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require "sinatra/content_for"

if development?
  require "sinatra/reloader"
  after_reload do
    puts 'Reloaded'
  end
end

require './lib/exercise'

set :start_date, Date.new(2020, 11, 30)

get '/' do
  latest_exercise = Exercise.by_date(Date.today)
  recent = (1..5).map do |i|
    Exercise.new(latest_exercise.index - i)
  end
  erb :index, locals: {latest_exercise: latest_exercise, recent: recent}
end


get '/exercise/:exercise_number' do
  exercise = Exercise.new(params[:exercise_number].to_i)
  erb :exercise, locals: {exercise: exercise}
end