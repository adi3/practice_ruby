module Enumerable
	def each_group_by_first_letter
		sorted = self.sort
		letter = sorted[0][0]
		words = Array.new

		sorted.each do |str|

			if str[0].eql?(letter)		# checks if first char in str is letter
				words.push(str)
			else
				yield letter, words
				letter = str[0]			# begin next sequence
				words.clear
				words.push(str)
			end

			if str.equal?(sorted.last)	# checks if str is the last element in the loop
				yield letter, words
			end
		end

	end
end

x = ["abcd", "mxyz", "able", "xyzab", "qrst"]

x.each_group_by_first_letter do |letter, words|
	printf("%s: %s\n", letter, words.join(" "))
end