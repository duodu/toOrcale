require 'oci8'
dbh = OCI8.new("appl","test","10.48.196.4:1521/hpdb07")
i = 0
commit = 'commit'
File.open("E:/lib/UUID.txt",'r') do |file|
  while uuid = file.gets
    sql = "INSERT INTO  STOCK_SKU_STOCK_JOURNAL (ID, BATCH_ID, TYPE, SKU_ID, NUM, EXT_REF_NO, SRC_SYSTEM_ID, ORIG_BATCH_ID, CREATE_TIME) 
VALUES (seq_stock_sku_stock_journal.nextval,'#{uuid}',2,#{10000+i},50,'ord_back#{i}','sys_back#{i}',1,sysdate)"
    dbh.exec(sql)
    dbh.exec(commit)
    i += 1
  end
end
dbh.logoff
