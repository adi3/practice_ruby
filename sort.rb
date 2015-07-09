def funny_sort(arr)
	arr.sort do |a, b|
		# regex to find first sequence of digits
		a_num = a.match(/\d+/)
		b_num = b.match(/\d+/)

		# matched data returned as array
		# extract first occurrence and convert to int
		a_num = a_num != nil ? a_num[0].to_i : -1
		b_num = b_num != nil ? b_num[0].to_i : -1

		a_num <=> b_num
	end
end

# prints out original and funny-sorted array
def print_funny_sort(arr)
	print "\nOriginal: "
	print arr
	print "\nSorted: "
	print funny_sort(arr)
	print "\n"
end

print_funny_sort(["f3oo", "23!@", "2no.6", " "])
print_funny_sort(["test1", "dmt003jsdf", "nada", "trying124"])
print_funny_sort(["81", "", "567", "8"])