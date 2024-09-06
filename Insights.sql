use spark;
show tables;

desc customerdetails;
-- 1. how many customers from each country 
select count(CustomerKey) As no_of_customers , Country from customerdetails group by Country ;


desc customers_sales_merged;
-- 2.how many female and male sell product in each country 
select distinct Gender ,sum(quantity)  as total_quantity, count(Order_Number) , Country from customers_sales_merged where Gender ="male" Group by Country ;
select  Gender ,sum(quantity) as total_quantity , Country from customers_sales_merged where Gender ="female" Group by Country ;
select count(Gender) from customers_sales_merged where Gender="female";
select distinct sum(quantity),Country from customers_sales_merged group by country;

desc exchangerates;
-- 3. get unique Currency 
select distinct Currency  from exchangerates; 

desc products_sales_merged;
-- 4. how many orders for products placed by each customer
SELECT  CustomerKey, Count(Order_Number) AS Total_orders  FROM products_sales_merged GROUP BY CustomerKey;

select distinct Category from products_sales_merged;

-- 5. Brands with its Categories of products 
select Distinct Brand,Category from products_sales_merged order by Brand ASC;


desc storesdetails;
-- 6. Stores in Each Country 
select distinct Country from storesdetails;
select count(StoreKey) As stores, Country ,State from storesdetails group by Country,State;

-- 7. how many stores opened in each year
SELECT COUNT(StoreKey) AS stores, YEAR(Open_Date) AS YEAR_opened FROM storesdetails GROUP BY YEAR_opened ORDER BY stores desc; 


desc storesdetails;
-- 8.store size in each country in each state 
select sum(Square_Meters) as Store_Size, Country from storesdetails Group by Country order by Store_Size;

desc salesdetails;
-- 9. how many orders and quantity of orders in each stores
SELECT count(Order_Number) as total_orders, SUM(Quantity) AS total_quantity, StoreKey FROM salesdetails GROUP BY StoreKey ORDER BY StoreKey;

desc customers_sales_merged;
-- 10. no of customers  
select count(CustomerKey) ,StoreKey from customers_sales_merged group by StoreKey order by StoreKey ASC;

desc productdetails;
--  11. product name and its price for each brand 
select distinct Brand from productdetails;
select distinct Product_Name , Unit_Price_USD from productdetails where Brand="Litware" order by Unit_Price_USD ASC;
