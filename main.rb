require 'rubygems'
require 'bundler/setup'
require 'sinatra'

if development?
  require "sinatra/reloader"
  also_reload 'public/style.css'
  after_reload do
    puts 'Reloaded'
  end
end

require './lib/exercise'

set :start_date, Date.new(2020, 11, 30)

get '/' do
  latest_exercise = Date.today - Date.new(2020, 12, 1)
  erb :index, locals: {latest_exercise: latest_exercise.to_i}
end


get '/exercise/:exercise_number' do
  exercise = Exercise.new(params[:exercise_number].to_i)
  erb :exercise, locals: {exercise: exercise}
end