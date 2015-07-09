class Adder
	def initialize(i)
		@num = i
	end

	def method_missing(m, *args, &block)
		if m.match(/plus\d+$/) != nil
			fn = m.to_s
			add = fn[4..-1].to_i 		# extract int to be added from function name
			Adder.class_eval(
				"def #{fn}
					return #{@num} + #{add};
				end"
			)
			send("plus#{add}")			# invokes the newly generated plus* method
		else
			super
		end
	end
end