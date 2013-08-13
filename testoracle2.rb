require "oci8"
x=Hash.new
y=Hash.new
begin
a=OCI8.new("appl","test05","10.48.196.4:1521/hpdb05")
sql="select merchanttransseq,amount from appl.merch_transaction_log"
cur1=a.exec(sql)
while row1=cur1.fetch
	x["#{row1[0]}"]=row1[1]
	
end
#puts x
cur1.close
a.logoff
end
begin
b=OCI8.new("appl","test08","10.48.196.4:1521/hpdb08")
x.each do |k,v|
	#puts k
	sql="select amount from appl.merch_transaction_log p where p.merchanttransseq=#{k}"
	cur2=b.exec(sql)
	v1=cur2.fetch
	if v1 != v then
		puts k
	end
	
#puts y
	cur2.close
end

b.logoff
end
#puts x
#puts y
