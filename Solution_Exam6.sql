/**Product Pagination Product Procedure**/

DELIMITER $$

USE `adventureworks`$$

DROP PROCEDURE IF EXISTS `product_pagination`$$

CREATE DEFINER = `root` @`localhost` PROCEDURE `product_pagination` (OFFSET INT (11), RowCount INT (11)) 
BEGIN
  SELECT 
    * 
  FROM
    product 
  ORDER BY ProductId 
  LIMIT OFFSET, RowCount ;
END $$

DELIMITER ;

/**Calling Product Pagination**/
CALL product_pagination(0,10)