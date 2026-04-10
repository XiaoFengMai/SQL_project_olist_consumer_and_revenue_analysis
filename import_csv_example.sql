COPY customers FROM 'C:\Users\L5M_Data\Desktop\olist_customers_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY orders FROM 'C:\Users\L5M_Data\Desktop\olist_orders_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY orders_items FROM 'C:\Users\L5M_Data\Desktop\olist_order_items_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY products FROM 'C:\Users\L5M_Data\Desktop\olist_products_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY payments FROM 'C:\Users\L5M_Data\Desktop\olist_order_payments_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY category_translation FROM 'C:\Users\L5M_Data\Desktop\product_category_name_translation.csv'
DELIMITER ',' CSV HEADER;

