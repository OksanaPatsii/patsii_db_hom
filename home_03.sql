1. Вывести ко-во поставщиков не из UK и не из China
  SELECT
  COUNT(*) AS number_of_suppliers_not_uk_not_china
  FROM Suppliers
  WHERE
  NOT Country IN('UK', 'China')

2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
    Categories.CategoryName,
    AVG(Products.Price) AS avg_price,
    MAX(Products.Price) AS max_price,
    MIN(Products.Price) AS min_price,
    SUM(Products.Price * OrderDetails.Quantity) AS number_of_products
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE Categories.CategoryID IN (3,5)
GROUP BY Categories.CategoryName;

3. Вывести общую сумму проданных товаров
SELECT
SUM(Products.Price * OrderDetails.Quantity) AS amount_sold_products
FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID

4. Вывести ко-во стран, которые поставляют напитки
SELECT
COUNT(Suppliers.Country) AS number_of_countries
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
WHERE Categories.CategoryName = 'Beverages'

5. Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT SUM(Products.Price * OrderDetails.Quantity) AS numbers_to_germany
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE Customers.Country = 'Germany'