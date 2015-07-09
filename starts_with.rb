def each_starts_with(arr, key)
	arr.each do |a|
		if a.match(/^#{key}/)	# regex to match start of string with key
			yield a
		end
	end
end

each_starts_with(["abcd", "axyz", "able", "xyzab", "qrst"], "ab") {|s| puts s}