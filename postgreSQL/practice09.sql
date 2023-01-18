CREATE TABLE customers_products
( 
  product_id int,
  customer_name varchar(50),
  product_name varchar(50)
);
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');

CREATE TABLE customers_likes
( 
  product_id int,
  customer_name varchar(50),
  liked_product varchar(50)
);
INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');

--* EXISTS komutu SUBQUERY'ler ile beraber kullanilir.
--* IN komutu OR komutunun kisa yazilmis halidir. 
--* IN komutunu tek basina SUBQUERY'lerle beraber kullanmayiz.
--* SUBQUERY kullanacaksaniz EXISTS kullanmaniz gerekir.


--* Product_id'leri ayni olan musterilerin isimlerini gosteriniz.

select customer_name from customers_products
where product_id in (select product_id from customers_likes where customers_products.product_id=customers_likes.product_id)

select customer_name from customers_products
where exists(select product_id from customers_likes where customers_products.product_id=customers_likes.product_id)


--* Product_name ile liked_product'i ayni olan musterilerin isimlerini gosteren kod

select customer_name from customers_products
where exists(select liked_product from customers_likes where customers_likes.liked_product=customers_products.product_name)


--Kac farkli meyve var?
select count(distinct product_name) as meyse_sayisi from customers_products


select product_name , count(distinct product_name) from customers_products
group by product_name


--Her iki tablodaki ortak id ve isimleri gosteren kodu yaziniz.
SELECT product_id ,
  customer_name
FROM customers_products

INTERSECT

SELECT  product_id ,
  customer_name
FROM customers_products;



