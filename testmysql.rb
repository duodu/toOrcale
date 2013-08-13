require "mysql"
dbh=Mysql.real_connect("localhost", "root", "zerolin", "world")
puts dbh.get_server_info
dbh.query('set names utf8')
sql="select * from city where id=75"
res=dbh.query(sql)
puts res.fetch_field.is_pri_key?
res.each do |row|
		puts "#{row[0]}\t #{row[1]}\t #{row[2]}\t  "
	end
	
	res.free
	puts "all #{dbh.affected_rows} rows data"
dbh.close
