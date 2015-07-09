def filter(arr, opts = nil)

	if opts == nil
		yield arr
		return
	end

	# extract given opts or init them to extremes
	min = opts.has_key?(:min) ? opts[:min] : -1/0.0
	max = opts.has_key?(:max) ? opts[:max] : 1/0.0
	odd = opts.has_key?(:odd) ? opts[:odd] : 0
	even = opts.has_key?(:even) ? opts[:even] : 0
	scale = opts.has_key?(:scale) ? opts[:scale] : 1

	arr.each do |num|
		if num < max and num > min						# check against min/max opts
			if not (not odd.zero? and num.even?)		# check against odd opt
				if not (not even.zero? and num.odd?)	# check against even opt
					yield scale * num					# yield with scaled opt
				end
			end
		end
	end
	
end


filter([1, 3, 5], :min => 2, :even => 0) {|n| puts n}
puts "\n"

nums = [6, -5, 319, 400, 18, 94, 11]

filter(nums, :min => 10, :max => 350, :odd => 1, :scale => 2) {|n| puts n}
puts "\n"

filter(nums, :max => 0) {|n| puts n}
puts "\n"

filter(nums) {|n| puts n}