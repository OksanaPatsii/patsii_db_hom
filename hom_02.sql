

1. Вывести название и стоимость в USD одного самого дорогого проданного товара
Products.ProductName,
Products.Price * 1.1 AS Price_usd
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID=Products.ProductID
ORDER BY Products.Price desc
LIMIT 1

2. Вывести два самых дорогих товара из категории Beverages из USA
SELECT *
FROM Products
JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE
Categories.CategoryName LIKE 'beverages'
    AND Suppliers.Country LIKE 'usa'

3. Удалить товары с ценой менее 5 EUR
DELETE FROM Products
WHERE
Price < 5

4. Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT Suppliers.Country
FROM Products
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE
Categories.CategoryName='Seafood'

5. Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET
ContactName=''
WHERE Country <> 'China'