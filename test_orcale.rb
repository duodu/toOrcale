require 'oci8'
dbh = OCI8.new("appl","test","10.48.196.4:1521/hpdb07")
sql = "select s.mdse_code from appl.stock_sku_stock s where s.id = 10000 or s.id = 10001"
dbh.exec(sql) do |row|
  puts row
end

dbh.logoff
