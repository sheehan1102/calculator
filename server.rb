require 'sinatra'
require 'sinatra/reloader'
require_relative "lib/calculator"

get "/" do
	erb :home
end

get "/add" do
	erb :add
end

get "/subtract" do
	erb :subtract
end

get "/multiply" do
	erb :multiply
end

get "/divide" do
	erb :divide
end

post "/calculate_add" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	result = Calculator.new.add(first, second)
	@hash = {
		:first => first,
		:second => second,
		:result => result,
		:method => '+'
	}
	erb :result
end

post "/calculate_subtract" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	result = Calculator.new.subtract(first, second)
	@hash = {
		:first => first,
		:second => second,
		:result => result,
		:method => '-'
	}
	erb :result
end

post "/calculate_multiply" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	result = Calculator.new.multiply(first, second)
	@hash = {
		:first => first,
		:second => second,
		:result => result,
		:method => '*'
	}
	erb :result
end

post "/calculate_divide" do
	first = params[:first_number].to_f
	second = params[:second_number].to_f
	result = Calculator.new.divide(first, second)
	@hash = {
		:first => first,
		:second => second,
		:result => result,
		:method => '/'
	}
	erb :result
end







