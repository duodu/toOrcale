require "oci8"
x=Hash.new
y=Hash.new
begin
a=OCI8.new("appl","test02","10.48.196.5:1521/hpdb02")
sql="select merchanttransseq,amount from appl.merch_transaction_log p"
sql2="select merchanttransseq,amount from log."
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
sql="select merchanttransseq,amount from appl.merch_transaction_log p where p.merchanttransdate like '2012122716%'"
cur2=b.exec(sql)
while row2=cur2.fetch
	y["#{row2[0]}"]=row2[1]
end
#puts y
cur2.close
b.logoff
end
#puts x
#puts y
begin
x.each do |k,v|
	 if y[k] != v then 
		puts k.to_s
	 end
 end
 end