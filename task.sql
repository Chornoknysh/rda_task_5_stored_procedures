USE ShopDB;

DELIMITER $$

CREATE PROCEDURE get_warehouse_product_inventory(IN inWarehouseID INT)
BEGIN
    /*
      Повертає список продуктів і їх кількість
      для конкретного складу (WarehouseID)
    */
    SELECT
        p.Name AS ProductName,
        pi.WarehouseAmount
    FROM ProductInventory AS pi
    JOIN Products AS p
        ON pi.ProductID = p.ID
    WHERE pi.WarehouseID = inWarehouseID;
END$$

DELIMITER ;
