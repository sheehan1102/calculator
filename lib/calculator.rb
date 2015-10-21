class Calculator
	ACTIONS = {
		"add" => :+,
		"subtract" => :-,
		"multiply" => :*,
		"divide" => :/
	}

	def initialize(hash = {})
		@number_store = YAML::Store.new("./public/result.yml")
		@hash = hash
	end

	def math
		first = @hash[:first_number].to_f
		second = @hash[:second_number].to_f
		method = @hash[:operation]
		[first, second].inject(ACTIONS[method])
	end

	def save(number)
		@number_store.transaction do
			@number_store["Result"] = number
		end
	end

	def load_result
		file = YAML.load_file(File.join('./public/result.yml'))
		file['Result']
	end
end