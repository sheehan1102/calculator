require 'sinatra'
require 'sinatra/reloader' if development?
require 'yaml/store'
require 'pry'
require_relative "lib/calculator"

get "/" do
	@result = Calculator.new.load_result
	erb :home
end

post "/save" do
	Calculator.new.save(params[:result])
	redirect to("/")
end

post "/result" do
	calculator = Calculator.new(params)
	@result = calculator.math
	erb :result
end







