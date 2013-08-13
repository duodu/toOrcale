for i in 1 .. mdse_count
  for j in 1 .. sku_count = 27
    for k in 1 .. sku_id_count = 3
      "declare
  i integer;
  j integer;
  k integer;
  TYPE type_array IS TABLE OF VARCHAR2(20) INDEX BY BINARY_INTEGER;
  stock_sku_stock_id_array type_array;
begin
  select s.id bulk collect
    into stock_sku_stock_id_array
    from appl.stock_sku_stock s
   order by s.id asc;
  for i in 1 .. stock_sku_stock_id_array.count loop
    for j in 1 .. 3 loop
      INSERT INTO STOCK_SKU_PROP
        (ID, SKU_STOCK_ID, PROP_NAME, PROP_VALUE)
      VALUES
        (seq_stock_sku_prop.nextval,
         stock_sku_stock_id_array(i),
         'sku_name_' || j,
         'sku_name_' || j || '_');
      commit;
    end loop;
  end loop;
/*  for i in 1 .. stock_sku_stock_id_array.count loop
    update appl.stock_sku_prop p
       set p.prop_value = 'sku_name_' || 
     where p.prop_value = 'sku_name';
  end loop;*/
end;"
    end
  end
end