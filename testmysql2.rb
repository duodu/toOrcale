class Testruby
	def initialize(id,col1,col2)
		@id=id
		@col1=col1
		@col2=col2
	end
	attr_accessor :id, :col1, :col2
end

instance1=Testruby.new(4,"true","false")
puts instance1.id
puts instance1.col1
puts instance1.col2
begin
	require "mysql"
	dbh=Mysql.real_connect("localhost", "root", "zerolin", "testruby")
#puts dbh.get_server_info
	sql1="insert into ruby1(idruby1,ruby1col,ruby1col1) values ('#{instance1.id}','#{dbh.escape_string(instance1.col1)}','#{dbh.escape_string(instance1.col2)}')"
	dbh.query(sql1)
	rescue Mysql::Error => e
		puts "Error Number: #{e.errno}"
		puts "Error Message: #{e.error}"
		puts "Error State: #{e.sqlstate}" if e.respond_to?("sqlstate")
	ensure
		dbh.close
end
	


#sql="select * from city where id=75"
#res=dbh.query(sql)
#puts res.fetch_field.is_pri_key?
#res.each do |row|
#		puts "#{row[0]}\t #{row[1]}\t #{row[2]}\t  "
#	end
	
#	res.free
#	puts "all #{dbh.affected_rows} rows data"
#dbh.close
