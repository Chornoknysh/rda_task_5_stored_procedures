USE ShopDB;

DELIMITER $$

-- Додаємо guard, щоб можна було безпечно перезапускати скрипт
DROP PROCEDURE IF EXISTS get_warehouse_product_inventory;

CREATE PROCEDURE get_warehouse_product_inventory(IN inWarehouseID INT)
BEGIN
    /*
      Повертає список продуктів і їх кількість
      для конкретного складу (WarehouseID)
    */
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
