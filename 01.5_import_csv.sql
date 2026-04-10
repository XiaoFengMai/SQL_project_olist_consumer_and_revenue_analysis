COPY customers FROM '/your/path/olist_customers_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY orders FROM '/your/path/olist_orders_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY order_items FROM '/your/path/olist_order_items_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY products FROM '/your/path/olist_products_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY payments FROM '/your/path/olist_order_payments_dataset.csv'
DELIMITER ',' CSV HEADER;

COPY category_translation FROM '/your/path/product_category_name_translation.csv'
DELIMITER ',' CSV HEADER;