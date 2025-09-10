DROP DATABASE IF EXISTS ShopDB;
CREATE DATABASE ShopDB;
USE ShopDB;

DELIMITER $$

DROP PROCEDURE IF EXISTS get_warehouse_product_inventory;

CREATE PROCEDURE get_warehouse_product_inventory(IN inWarehouseID INT)
BEGIN
    SELECT
        p.Name AS ProductName,
        pi.WarehouseAmount AS Amount
    FROM ProductInventory AS pi
    JOIN Products AS p
        ON pi.ProductID = p.ID
    WHERE pi.WarehouseID = inWarehouseID
    ORDER BY p.Name;
END$$

DELIMITER ;
