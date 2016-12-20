# SQL Manager 2011 Lite for MySQL 5.0.0.3
# ---------------------------------------
# Host     : localhost
# Port     : 3306
# Database : work_managment


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `work_managment`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `work_managment`;

#
# Structure for the `attempts` table : 
#

CREATE TABLE `attempts` (
  `ip` varchar(15) NOT NULL,
  `count` int(11) NOT NULL,
  `expiredate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Structure for the `call_statuses` table : 
#

CREATE TABLE `call_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_status_name` varchar(50) CHARACTER SET cp1251 NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Structure for the `call_statuses_rels` table : 
#

CREATE TABLE `call_statuses_rels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `call_id` int(11) NOT NULL,
  `call_status_id` int(11) NOT NULL,
  `call_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 PACK_KEYS=0;

#
# Structure for the `calls` table : 
#

CREATE TABLE `calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL,
  `kg_id` int(11) NOT NULL,
  `call_status_id` int(11) DEFAULT NULL,
  `call_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed` int(11) NOT NULL DEFAULT '0',
  `calls_comment` varchar(500) DEFAULT NULL,
  `stock_id` int(11) NOT NULL DEFAULT '0',
  `repeat_call_datetime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operator_id` (`operator_id`),
  KEY `kg_id` (`kg_id`),
  KEY `call_status_id` (`call_status_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

#
# Structure for the `calls_stocks_rels` table : 
#

CREATE TABLE `calls_stocks_rels` (
  `stock_id` int(11) NOT NULL,
  `call_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;

#
# Structure for the `districts` table : 
#

CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;

#
# Structure for the `kinder_gartens` table : 
#

CREATE TABLE `kinder_gartens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `kg_area` varchar(100) NOT NULL,
  `kg_adress` varchar(255) NOT NULL,
  `kg_phones` varchar(255) DEFAULT NULL,
  `kg_contact_person` varchar(255) DEFAULT NULL,
  `kg_status` varchar(255) DEFAULT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) DEFAULT NULL,
  `kg_comment` varchar(500) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Structure for the `meeting_results` table : 
#

CREATE TABLE `meeting_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `plot_id` int(11) NOT NULL,
  `meeting_result_type_id` int(11) NOT NULL,
  `call_id` int(11) NOT NULL DEFAULT '-1',
  `manager_id` int(11) NOT NULL DEFAULT '-1',
  `planned_shooting_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meeting_result_comment` varchar(255) DEFAULT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `meeting_id` (`meeting_id`),
  KEY `plot_id` (`plot_id`),
  KEY `stock_id` (`stock_id`),
  KEY `meeting_res_type_id` (`meeting_result_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

#
# Structure for the `meeting_results_types` table : 
#

CREATE TABLE `meeting_results_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meeting_result_type_name` varchar(50) NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

#
# Structure for the `meetings` table : 
#

CREATE TABLE `meetings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operator_id` int(11) NOT NULL,
  `call_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `meeting_date` date DEFAULT NULL,
  `meeting_time` time DEFAULT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  `meeting_result_type_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `call_id` (`call_id`),
  KEY `operator_id` (`operator_id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Structure for the `order_statuses` table : 
#

CREATE TABLE `order_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_name` varchar(150) NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 PACK_KEYS=0;

#
# Structure for the `order_statuses_rels` table : 
#

CREATE TABLE `order_statuses_rels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 PACK_KEYS=0;

#
# Structure for the `orders` table : 
#

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kg_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL DEFAULT '-1',
  `stock_id` int(11) NOT NULL DEFAULT '-1',
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shooting_date` date DEFAULT NULL,
  `shooting_time` time DEFAULT NULL,
  `planned_child_count` int(11) DEFAULT '0',
  `order_comment` varchar(255) DEFAULT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  `shooting_place` varchar(255) DEFAULT NULL,
  `group_count` int(11) DEFAULT '0',
  `little_group_count` int(11) DEFAULT '0',
  `order_status_id` int(11) DEFAULT '0',
  `repeat_call_datetime` timestamp NULL DEFAULT NULL,
  `our_fault` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `stock_id` (`stock_id`),
  KEY `kg_id` (`kg_id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Structure for the `orders_plots_rels` table : 
#

CREATE TABLE `orders_plots_rels` (
  `plot_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `child_count` int(11) NOT NULL DEFAULT '0',
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 PACK_KEYS=0;

#
# Structure for the `person_types` table : 
#

CREATE TABLE `person_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_type_name` varchar(50) NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Structure for the `persons` table : 
#

CREATE TABLE `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `person_type_id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `sur_name` varchar(100) DEFAULT NULL,
  `stationare_phones` varchar(255) DEFAULT 'Не заданы',
  `mobile_phones` varchar(255) DEFAULT 'Не заданы',
  `employment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dismissal_date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `closed` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `person_type_id` (`person_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

#
# Structure for the `plots` table : 
#

CREATE TABLE `plots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `plot_name` varchar(100) NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for the `sessions` table : 
#

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `expiredate` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

#
# Structure for the `shooting_statuses` table : 
#

CREATE TABLE `shooting_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shooting_status_name` varchar(255) NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;

#
# Structure for the `shootings` table : 
#

CREATE TABLE `shootings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shooting_date` date DEFAULT NULL,
  `shooting_time` time DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `manager_id` int(11) NOT NULL,
  `stock_id` int(11) NOT NULL,
  `child_count` int(11) DEFAULT '0',
  `closed` int(11) NOT NULL DEFAULT '0',
  `kg_id` int(11) DEFAULT NULL,
  `shooting_status_id` int(11) DEFAULT '0',
  `real_count` int(11) NOT NULL DEFAULT '0',
  `back_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `stock_id` (`stock_id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for the `states` table : 
#

CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_name` varchar(255) NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0;

#
# Structure for the `stocks` table : 
#

CREATE TABLE `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `stock_name` varchar(100) NOT NULL,
  `closed` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Structure for the `users` table : 
#

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT 'psdevelop@yandex.ru',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `activekey` varchar(15) NOT NULL DEFAULT '0',
  `resetkey` varchar(15) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Definition for the `get_call_statuses_names` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `get_call_statuses_names`(
        IN in_call_id INTEGER(11),
        OUT call_statuses_names VARCHAR(500)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE b INT;
    DECLARE fetch_cst_name VARCHAR(255);
    DECLARE res_cst_name VARCHAR(500); 
    DECLARE cst_cur CURSOR FOR 
    	SELECT CONCAT(`csr`.`call_date`,' ',cst.`call_status_name`) 
        FROM `call_statuses` cst, `call_statuses_rels` csr 
        WHERE cst.id = csr.`call_status_id` AND csr.`call_id`=in_call_id; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1; 

    OPEN cst_cur; 
    SET b = 0; 
    SET res_cst_name = ''; 
    WHILE b = 0 DO 
        FETCH cst_cur INTO fetch_cst_name; 
        IF b = 0 THEN 
            SET res_cst_name = 
            	CONCAT(res_cst_name,' ', fetch_cst_name); 
    	END IF; 
    END WHILE; 
    CLOSE cst_cur; 
    SET call_statuses_names = res_cst_name;
END;

#
# Definition for the `f_get_call_statuses_names` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `f_get_call_statuses_names`(
        in_call_id INTEGER(11)
    )
    RETURNS varchar(500) CHARSET utf8
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  SET @call_statuses_names=NULL;
  call `get_call_statuses_names`(in_call_id, 
  	@call_statuses_names);
  RETURN @call_statuses_names;
END;

#
# Definition for the `get_call_stocks_names` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `get_call_stocks_names`(
        IN in_call_id INTEGER(11),
        OUT calls_names VARCHAR(500)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE b INT;
    DECLARE fetch_stock_name VARCHAR(255);
    DECLARE res_stock_name VARCHAR(500); 
    DECLARE stocks_cur CURSOR FOR 
    	SELECT st.stock_name 
        FROM `stocks` st, `calls_stocks_rels` csr 
        WHERE `st`.id = csr.`stock_id` AND csr.`call_id`=in_call_id; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1; 

    OPEN stocks_cur; 
    SET b = 0; 
    SET res_stock_name = ''; 
    WHILE b = 0 DO 
        FETCH stocks_cur INTO fetch_stock_name; 
        IF b = 0 THEN 
            SET res_stock_name = 
            	CONCAT(res_stock_name,' ', fetch_stock_name); 
    	END IF; 
    END WHILE; 
    CLOSE stocks_cur; 
    SET calls_names = res_stock_name;
END;

#
# Definition for the `f_get_call_stocks_names` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `f_get_call_stocks_names`(
        in_call_id INTEGER(11)
    )
    RETURNS varchar(500) CHARSET utf8
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  SET @stocks_names=NULL;
  call `get_call_stocks_names`(in_call_id, 
  	@stocks_names);
  RETURN @stocks_names;
END;

#
# Definition for the `get_kg_orders_count` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `get_kg_orders_count`(
        IN in_kg_id INTEGER(11),
        OUT order_count INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE c INT;
    SET @c=0;
    
    SELECT COUNT(*) INTO @c FROM orders WHERE kg_id=in_kg_id;
     
    SET order_count = @c;
END;

#
# Definition for the `f_get_kg_orders_count` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `f_get_kg_orders_count`(
        in_kg_id INTEGER(11)
    )
    RETURNS int(11)
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  SET @order_count=0;
  call `get_kg_orders_count`(in_kg_id, 
  	@order_count);
  RETURN @order_count;
END;

#
# Definition for the `get_kg_without_stocks_names` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `get_kg_without_stocks_names`(
        IN in_kg_id INTEGER(11),
        OUT stocks_names VARCHAR(500)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE b INT;
    DECLARE c INT;
    DECLARE fetch_stock_name VARCHAR(255);
    DECLARE res_stock_name VARCHAR(500); 
    DECLARE stocks_cur CURSOR FOR 
    	SELECT st.stock_name 
        FROM `stocks` st, `calls` cl 
        WHERE `st`.id = cl.`stock_id` AND cl.`kg_id`=in_kg_id AND `cl`.`closed`<>1;
    
    DECLARE ord_stocks_cur CURSOR FOR 
    	SELECT st.stock_name 
        FROM `stocks` st  
        WHERE `st`.id NOT IN (select `stock_id` 
        	from orders where `kg_id`=in_kg_id and closed<>1);    
         
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1;  

    OPEN stocks_cur; 
    SET b = 0; 
    SET res_stock_name = ''; 
    WHILE b = 0 DO 
        FETCH stocks_cur INTO fetch_stock_name; 
        IF b = 0 THEN 
            SET res_stock_name = 
            	CONCAT(res_stock_name,' ', fetch_stock_name); 
    	END IF; 
    END WHILE; 
    CLOSE stocks_cur;
    
    SET stocks_names = CONCAT('<b>Были звонки по акциям:</b> ',res_stock_name);

    OPEN ord_stocks_cur; 
    SET b = 0; 
    SET res_stock_name = ''; 
    WHILE b = 0 DO 
        FETCH ord_stocks_cur INTO fetch_stock_name; 
        IF b = 0 THEN 
            SET res_stock_name = 
            	CONCAT(res_stock_name,' ', fetch_stock_name); 
    	END IF; 
    END WHILE; 
    CLOSE ord_stocks_cur;
     
    SET stocks_names = CONCAT(stocks_names,'.<b>Нет заказов по акциям:</b> ',res_stock_name);
END;

#
# Definition for the `f_get_kg_without_stocks_names` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `f_get_kg_without_stocks_names`(
        in_kg_id INTEGER(11)
    )
    RETURNS varchar(500) CHARSET utf8
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  SET @stocks_names='Нет данных';
  call `get_kg_without_stocks_names`(in_kg_id, 
  	@stocks_names);
  RETURN @stocks_names;
END;

#
# Definition for the `get_meeting_statuses_names` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `get_meeting_statuses_names`(
        IN in_meeting_id INTEGER(11),
        OUT meeting_statuses_names VARCHAR(500)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE b INT;
    DECLARE fetch_cst_name VARCHAR(255);
    DECLARE res_cst_name VARCHAR(500); 
    DECLARE cst_cur CURSOR FOR 
    	SELECT CONCAT(IFNULL(`csr`.`planned_shooting_date`,' '),' ',cst.`meeting_result_type_name`) 
        FROM `meeting_results_types` cst, `meeting_results` csr 
        WHERE cst.id = csr.`meeting_result_type_id` 
        AND csr.`meeting_id`=in_meeting_id; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1; 

    OPEN cst_cur; 
    SET b = 0; 
    SET res_cst_name = ''; 
    WHILE b = 0 DO 
        FETCH cst_cur INTO fetch_cst_name; 
        IF b = 0 THEN 
            SET res_cst_name = 
            	CONCAT(res_cst_name,' ', fetch_cst_name); 
    	END IF; 
    END WHILE; 
    CLOSE cst_cur; 
    SET meeting_statuses_names = res_cst_name;
END;

#
# Definition for the `f_get_meeting_statuses_names` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `f_get_meeting_statuses_names`(
        in_meeting_id INTEGER(11)
    )
    RETURNS varchar(500) CHARSET utf8
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  SET @meeting_statuses_names=NULL;
  call `get_meeting_statuses_names`(in_meeting_id, 
  	@meeting_statuses_names);
  RETURN @meeting_statuses_names;
END;

#
# Definition for the `get_order_plots_names` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `get_order_plots_names`(
        IN in_order_id INTEGER(11),
        OUT plots_names VARCHAR(500)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE b INT;
    DECLARE fetch_plot_name VARCHAR(255);
    DECLARE res_plot_name VARCHAR(500); 
    DECLARE plots_cur CURSOR FOR 
    	SELECT CONCAT(pl.code,' ',pl.plot_name) as plot_full_name 
        FROM plots pl, orders_plots_rels opl 
        WHERE `pl`.id = opl.`plot_id` AND opl.`order_id`=in_order_id; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1; 

    OPEN plots_cur; 
    SET b = 0; 
    SET res_plot_name = ''; 
    WHILE b = 0 DO 
        FETCH plots_cur INTO fetch_plot_name; 
        IF b = 0 THEN 
            SET res_plot_name = 
            	CONCAT(res_plot_name,' ', fetch_plot_name); 
    	END IF; 
    END WHILE; 
    CLOSE plots_cur; 
    SET plots_names = res_plot_name;
END;

#
# Definition for the `f_get_order_plots_names` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `f_get_order_plots_names`(
        in_order_id INTEGER(11)
    )
    RETURNS varchar(500) CHARSET utf8
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  SET @plots_names=NULL;
  call `get_order_plots_names`(in_order_id, 
  	@plots_names);
  RETURN @plots_names;
END;

#
# Definition for the `get_order_statuses_names` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `get_order_statuses_names`(
        IN in_order_id INTEGER(11),
        OUT order_statuses_names VARCHAR(500)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE b INT;
    DECLARE fetch_cst_name VARCHAR(255);
    DECLARE res_cst_name VARCHAR(500); 
    DECLARE cst_cur CURSOR FOR 
    	SELECT CONCAT(`csr`.`order_date`,' ',cst.`order_status_name`) 
        FROM `order_statuses` cst, `order_statuses_rels` csr 
        WHERE cst.id = csr.`order_status_id` AND csr.`order_id`=in_order_id; 
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET b = 1; 

    OPEN cst_cur; 
    SET b = 0; 
    SET res_cst_name = ''; 
    WHILE b = 0 DO 
        FETCH cst_cur INTO fetch_cst_name; 
        IF b = 0 THEN 
            SET res_cst_name = 
            	CONCAT(res_cst_name,' ', fetch_cst_name); 
    	END IF; 
    END WHILE; 
    CLOSE cst_cur; 
    SET order_statuses_names = res_cst_name;
END;

#
# Definition for the `f_get_order_statuses_names` function : 
#

CREATE DEFINER = 'root'@'localhost' FUNCTION `f_get_order_statuses_names`(
        in_order_id INTEGER(11)
    )
    RETURNS varchar(500) CHARSET utf8
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
  SET @order_statuses_names=NULL;
  call `get_order_statuses_names`(in_order_id, 
  	@order_statuses_names);
  RETURN @order_statuses_names;
END;

#
# Definition for the `add_attempt` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_attempt`(
        IN in_ip VARCHAR(15)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE acount INTEGER;
    SET @acount=0;
    SELECT COUNT(*) INTO @acount FROM attempts where 
    ip=in_ip;
    IF (@acount=0) THEN
    	INSERT INTO `attempts` 
    	(`ip`, `count`, `expiredate`)                                 
    	VALUES (in_ip, 1, NOW());
    ELSE
    	UPDATE attempts SET count=count+1 where 
    	ip=in_ip;
    END IF;	
END;

#
# Definition for the `add_empty_call_meeting` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_empty_call_meeting`(
        IN in_call_id INTEGER(11),
        OUT meeting_id INTEGER(11),
        IN in_call_status_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SET @new_status_name=NULL;
    SELECT call_status_name INTO @new_status_name FROM call_statuses 
    WHERE id=in_call_status_id;
    IF (@new_status_name = 'Встреча') THEN
    	SET @call_operator_id=0;
    	SELECT operator_id INTO @call_operator_id from 
    		calls WHERE id=in_call_id LIMIT 1;
    	IF ISNULL(@call_operator_id) THEN
    		SET @call_operator_id=0;
    	END IF;
		INSERT INTO `meetings` (`id`, `operator_id`, `call_id`,
			`manager_id`, `meeting_date`, `meeting_time`) 
    		VALUES (NULL, @call_operator_id, in_call_id, 
    		0, NULL, NULL);
		SET meeting_id = LAST_INSERT_ID();
    END IF;
END;

#
# Definition for the `add_empty_meeting_order` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_empty_meeting_order`(
        IN in_meeting_id INTEGER(11),
        INOUT order_id INTEGER(11),
        IN in_meeting_result_type_id INTEGER(11),
        IN in_stock_id INTEGER(11),
        IN in_planned_date TIMESTAMP,
        IN in_plot_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SET @new_status_name=NULL;
    SET @new_order_manager_id=0;
    SET @new_order_call_id=0;
    SET @new_order_kg_id=0;
    SET @new_order_stock_id=0;
    SELECT `meeting_result_type_name` INTO @new_status_name FROM `meeting_results_types` 
    WHERE id=in_meeting_result_type_id;
    SELECT manager_id, call_id INTO @new_order_manager_id, @new_order_call_id 
    FROM `meetings` WHERE id=in_meeting_id;
    SELECT kg_id, stock_id INTO @new_order_kg_id, @new_order_stock_id FROM calls 
    WHERE id=@new_order_call_id;
    IF ISNULL(@new_order_manager_id) THEN
    	SET @new_order_manager_id=0;
    END IF;
    IF (@new_status_name = 'Заказ')  
    	AND (@new_order_kg_id>0) THEN
        INSERT INTO `orders` (`id`, `kg_id`,
        	`manager_id`, `stock_id`, `order_date`, `shooting_date`,
            `shooting_time`, `planned_child_count`, `order_comment`,
            `shooting_place`,`group_count`,`little_group_count`) 
    	VALUES (NULL, @new_order_kg_id, @new_order_manager_id, in_stock_id, 
        	CURRENT_TIMESTAMP(), CAST(in_planned_date as DATE), 
            CAST(in_planned_date as TIME),
            0, '', '', 0, 0);
		SET order_id = LAST_INSERT_ID();
        insert into orders_plots_rels(order_id, plot_id) 
        VALUES(order_id, in_plot_id);
    END IF;
END;

#
# Definition for the `add_empty_order_shooting` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_empty_order_shooting`(
        IN in_order_id INTEGER(11),
        OUT shooting_id INTEGER(11),
        IN in_order_status_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	SET @new_status_name=NULL;
    SELECT order_status_name INTO @new_status_name FROM order_statuses 
    WHERE id=in_order_status_id;
    IF (@new_status_name = 'Выполнение') THEN
    	SET @shooting_manager_id=0;
        SET @shooting_stock_id=0;
        SET @shooting_kg_id=0;
    	SELECT manager_id, stock_id, kg_id, shooting_date,
        	shooting_time, planned_child_count INTO @shooting_manager_id,
        	@shooting_stock_id, @shooting_kg_id, @shooting_date,
            @shooting_time, @planned_child_count from 
    		orders WHERE id=in_order_id LIMIT 1;
    	IF ISNULL(@shooting_manager_id) THEN
    		SET @shooting_manager_id=0;
    	END IF;
        IF ISNULL(@shooting_stock_id) THEN
    		SET @shooting_stock_id=0;
    	END IF;
        IF ISNULL(@shooting_kg_id) THEN
    		SET @shooting_kg_id=0;
    	END IF;
		INSERT INTO `shootings` (`id`, `shooting_date`, `shooting_time`,
			`order_id`, `manager_id`, `stock_id`, `child_count`, `kg_id`) 
    		VALUES (NULL, @shooting_date, @shooting_time, 
    		in_order_id, @shooting_manager_id, @shooting_stock_id, 
            @planned_child_count, @shooting_kg_id);
		SET shooting_id = LAST_INSERT_ID();
    END IF;
END;

#
# Definition for the `add_not_empty_call` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_not_empty_call`(
        IN in_stock_id INTEGER(11),
        IN in_op_id INTEGER(11),
        IN in_kg_id INTEGER(11),
        IN in_call_status_id INTEGER(11),
        IN comment1 VARCHAR(255),
        IN comment2 VARCHAR(255),
        IN comment3 VARCHAR(255),
        IN comment4 VARCHAR(255),
        IN comment_head VARCHAR(255)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF (NOT (((comment1='') OR (comment1=' ') OR (comment1='  ')) AND 
    	((comment2='') OR (comment2=' ') OR (comment2='  ')) AND 
        ((comment3='') OR (comment3=' ') OR (comment3='  ')) AND 
        ((comment4='') OR (comment4=' ') OR (comment4='  ')) )) THEN
        insert into `calls` (`stock_id`,`operator_id`, `kg_id`, 
        	`call_status_id`, `call_date`, `closed`, `calls_comment`) 
		VALUES (in_stock_id,in_op_id, in_kg_id,in_call_status_id,NOW(), 2,
        	concat(comment_head, ' Статус-дата: ', comment1, ' Рез-т: ',
            comment2, ' Съемка: ', comment3, ' ', comment4));
    END IF;
END;

#
# Definition for the `add_not_empty_order_plot` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_not_empty_order_plot`(
        IN in_order_id INTEGER(11),
        IN in_plot_id INTEGER(11),
        IN in_plot_str VARCHAR(255),
        IN in_child_count VARCHAR(255)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ((in_plot_str LIKE '%x%') OR (in_plot_str LIKE '%х%'))
    	AND NOT (ISNULL(in_order_id) OR ISNULL(in_plot_id)) THEN
    	insert into orders_plots_rels (id, plot_id, order_id,child_count) 
        values (NULL, in_plot_id, in_order_id,
        CAST(in_child_count AS UNSIGNED));
    END IF;
END;

#
# Definition for the `add_order_and_shoot` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_order_and_shoot`(
        IN in_kg_id INTEGER(11),
        IN in_plot_str VARCHAR(255),
        IN in_manager_id INTEGER(11),
        IN in_ch_count INTEGER(11),
        IN in_order_comment VARCHAR(500),
        OUT new_order_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ((in_plot_str LIKE '%x%') OR (in_plot_str LIKE '%х%')) THEN
    	insert into orders ( kg_id,manager_id,
        stock_id,shooting_date, shooting_time, 
        planned_child_count, order_comment, closed, order_date) 
        values ( in_kg_id, in_manager_id,
        0, CURDATE(),CURTIME(),in_ch_count,
        in_order_comment,2, NOW());
        SET new_order_id = LAST_INSERT_ID()*ROW_COUNT();
        insert into shootings (shooting_date, shooting_time, 
        order_id, manager_id, stock_id, child_count, closed,
        kg_id) VALUES (CURDATE(), CURTIME(),new_order_id,
        in_manager_id, 0, in_ch_count,2, in_kg_id);
    END IF;
END;

#
# Definition for the `add_update_call` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_call`(
        IN in_operator_id INTEGER(11),
        IN in_kg_id INTEGER(11),
        IN in_call_status_id INTEGER(11),
        IN in_call_date TIMESTAMP,
        IN in_calls_comment VARCHAR(500),
        INOUT call_id INTEGER(11),
        IN in_stock_id INTEGER(11),
        IN in_repeat_call_datetime TIMESTAMP
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(call_id) THEN
        INSERT INTO `calls` (`id`, `operator_id`, `kg_id`,
        	`call_status_id`, `call_date`, `calls_comment`,`stock_id`,
            `repeat_call_datetime`) 
    	VALUES (NULL, in_operator_id, in_kg_id, 
        	in_call_status_id, in_call_date, in_calls_comment,
            in_stock_id, in_repeat_call_datetime);
		SET call_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `calls` SET operator_id=in_operator_id, kg_id=in_kg_id, 
        	 call_status_id=in_call_status_id, call_date=in_call_date, 
             calls_comment=in_calls_comment, stock_id=in_stock_id, 
             repeat_call_datetime=in_repeat_call_datetime  
        WHERE id=call_id;
    END IF;
END;

#
# Definition for the `add_update_call_status` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_call_status`(
        IN in_call_status_name VARCHAR(100),
        INOUT call_status_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(call_status_id) THEN
        INSERT INTO `call_statuses` (`id`, `call_status_name`) 
    	VALUES (NULL, in_call_status_name);
		SET call_status_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `call_statuses` SET call_status_name=in_call_status_name 
        WHERE id=call_status_id;
    END IF;
END;

#
# Definition for the `add_update_district` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_district`(
        IN in_district_name VARCHAR(255),
        IN in_state_id INTEGER(11),
        INOUT district_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(district_id) THEN
        INSERT INTO `districts` (`id`, `state_id`, `district_name`) 
    	VALUES (NULL, in_state_id, in_district_name);
		SET district_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `districts` SET state_id=in_state_id, 
        district_name=in_district_name 
        WHERE id=district_id;
    END IF;
END;

#
# Definition for the `add_update_kg` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_kg`(
        IN in_code VARCHAR(50),
        IN in_kg_area VARCHAR(100),
        IN in_kg_adress VARCHAR(255),
        IN in_kg_phones VARCHAR(255),
        IN in_kg_contact_person VARCHAR(255),
        IN in_kg_status VARCHAR(255),
        IN in_district_id INTEGER(11),
        INOUT kg_id INTEGER(11),
        IN in_email VARCHAR(150),
        IN in_kg_comment VARCHAR(500)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(kg_id) THEN
        INSERT INTO `kinder_gartens` (`id`, `code`, `kg_area`, `kg_adress`,
        	`kg_phones`, `kg_contact_person`, `kg_status`, `district_id`,
            `email`,`kg_comment`) 
    	VALUES (NULL, in_code, in_kg_area, in_kg_adress, in_kg_phones, 
        	in_kg_contact_person, in_kg_status, in_district_id, in_email,
            in_kg_comment);
		SET kg_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `kinder_gartens` SET code=in_code, kg_area=in_kg_area,
        	 kg_adress=in_kg_adress, kg_phones=in_kg_phones, 
             kg_contact_person=in_kg_contact_person, 
             kg_status=in_kg_status, district_id=in_district_id,
             email=in_email, kg_comment=in_kg_comment   
        WHERE id=kg_id;
    END IF;
END;

#
# Definition for the `add_update_meeting` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_meeting`(
        IN in_operator_id INTEGER(11),
        IN in_call_id INTEGER(11),
        IN in_manager_id INTEGER(11),
        IN in_meeting_date DATE,
        IN in_meeting_time TIME,
        INOUT meeting_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(meeting_id) THEN
        INSERT INTO `meetings` (`id`, `operator_id`, `call_id`,
        	`manager_id`, `meeting_date`, `meeting_time`) 
    	VALUES (NULL, in_operator_id, in_call_id, 
        	in_manager_id, in_meeting_date, in_meeting_time);
		SET meeting_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `meetings` SET operator_id=in_operator_id, call_id=in_call_id, 
        	 manager_id=in_manager_id, meeting_date=in_meeting_date, 
             meeting_time=in_meeting_time 
        WHERE id=meeting_id;
    END IF;
END;

#
# Definition for the `add_update_meeting_result` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_meeting_result`(
        IN in_meeting_id INTEGER(11),
        IN in_stock_id INTEGER(11),
        IN in_plot_id INTEGER(11),
        IN in_meeting_result_type_id INTEGER(11),
        IN in_call_id INTEGER(11),
        IN in_manager_id INTEGER(11),
        IN in_planned_shooting_date TIMESTAMP,
        IN in_meeting_result_comment VARCHAR(255),
        INOUT meeting_result_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(meeting_result_id) THEN
        INSERT INTO `meeting_results` (`id`, `meeting_id`, `stock_id`,
        	`plot_id`, `meeting_result_type_id`, `call_id`, `manager_id`,
            `planned_shooting_date`, `meeting_result_comment`) 
    	VALUES (NULL, in_meeting_id, in_stock_id, in_plot_id, 
        	in_meeting_result_type_id, in_call_id, in_manager_id, 
            in_planned_shooting_date, in_meeting_result_comment);
		SET meeting_result_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `meeting_results` SET meeting_id=in_meeting_id, stock_id=in_stock_id, 
        	 plot_id=in_plot_id, meeting_result_type_id=in_meeting_result_type_id, 
             call_id=in_call_id, manager_id=in_manager_id, 
             planned_shooting_date=in_planned_shooting_date, 
             meeting_result_comment=in_meeting_result_comment   
        WHERE id=meeting_result_id;
    END IF;
END;

#
# Definition for the `add_update_meeting_result_type` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_meeting_result_type`(
        IN in_meeting_res_type_name VARCHAR(100),
        INOUT meeting_result_type_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(meeting_result_type_id) THEN
        INSERT INTO `meeting_results_types` (`id`, `meeting_result_type_name`) 
    	VALUES (NULL, in_meeting_res_type_name);
		SET meeting_result_type_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `meeting_results_types` 
        SET meeting_result_type_name=in_meeting_res_type_name 
        WHERE id=meeting_result_type_id;
    END IF;
END;

#
# Definition for the `add_update_order` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_order`(
        IN in_kg_id INTEGER(11),
        IN in_manager_id INTEGER(11),
        IN in_stock_id INTEGER(11),
        IN in_order_date TIMESTAMP,
        IN in_shooting_date DATE,
        IN in_shooting_time TIME,
        IN in_planned_child_count INTEGER(11),
        IN in_order_comment VARCHAR(255),
        INOUT order_id INTEGER(11),
        IN in_shooting_place VARCHAR(255),
        IN in_group_count INTEGER(11),
        IN in_little_group_count INTEGER(11),
        IN in_repeat_call_datetime TIMESTAMP,
        IN in_our_fault BIT
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(order_id) THEN
        INSERT INTO `orders` (`id`, `kg_id`,
        	`manager_id`, `stock_id`, `order_date`, `shooting_date`,
            `shooting_time`, `planned_child_count`, `order_comment`,
            `shooting_place`,`group_count`,`little_group_count`, 
            `repeat_call_datetime`, `our_fault`) 
    	VALUES (NULL, in_kg_id, in_manager_id, in_stock_id, 
        	in_order_date, in_shooting_date, in_shooting_time,
            in_planned_child_count, in_order_comment, 
            in_shooting_place, in_group_count, in_little_group_count,
            in_repeat_call_datetime, in_our_fault);
		SET order_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `orders` SET kg_id=in_kg_id, 
        	 manager_id=in_manager_id, stock_id=in_stock_id,
             order_date=in_order_date, shooting_date=in_shooting_date,
             shooting_time=in_shooting_time, 
             planned_child_count=in_planned_child_count,
             order_comment=in_order_comment, shooting_place=in_shooting_place,
             group_count=in_group_count, little_group_count=in_little_group_count,
             repeat_call_datetime=in_repeat_call_datetime,
             our_fault=in_our_fault 
        WHERE id=order_id;
    END IF;
END;

#
# Definition for the `add_update_person` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_person`(
        IN in_person_type_id INTEGER(11),
        INOUT in_person_id INTEGER(11),
        IN in_first_name VARCHAR(100),
        IN in_last_name VARCHAR(100),
        IN in_sur_name VARCHAR(100),
        IN in_st_phones VARCHAR(255),
        IN in_mob_phones VARCHAR(255),
        IN in_empl_date TIMESTAMP,
        IN in_code VARCHAR(10),
        IN in_dismissal_date TIMESTAMP
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE code VARCHAR(10);
   	IF ISNULL(in_person_id) THEN
    	SET @code='МН';
		IF @person_type_id=1 THEN
    		SET @code='ОП';
    	ELSE
    		SET @code='МН';
    	END IF;
    	INSERT INTO `persons` (`id`, `code`, `person_type_id`, `first_name`, 
    	`last_name`, `sur_name`, `stationare_phones`, `mobile_phones`, 
    	`employment_date`, `dismissal_date`) 
    	VALUES (NULL,@code,in_person_type_id,in_first_name,in_last_name,
    	in_sur_name,in_st_phones,in_mob_phones,NOW(),NULL);
		SET in_person_id = LAST_INSERT_ID();
    	SET @code = @code + in_person_id;
    	UPDATE `persons` SET code=@code WHERE id=in_person_id;
    ELSE
    	UPDATE `persons` SET code=in_code, person_type_id=in_person_type_id, 
        	 first_name=in_first_name, last_name=in_last_name, sur_name=in_sur_name, 
             stationare_phones=in_st_phones, mobile_phones=in_mob_phones, 
             dismissal_date = in_dismissal_date  
        WHERE id=in_person_id;
    END IF;

END;

#
# Definition for the `add_update_plot` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_plot`(
        IN in_code VARCHAR(10),
        IN in_plot_name VARCHAR(100),
        INOUT plot_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(plot_id) THEN
        INSERT INTO `plots` (`id`, `code`, `plot_name`) 
    	VALUES (NULL, in_code, in_plot_name);
		SET plot_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `plots` SET code=in_code, plot_name=in_plot_name 
        WHERE id=plot_id;
    END IF;
END;

#
# Definition for the `add_update_shooting` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_shooting`(
        IN in_manager_id INTEGER(11),
        IN in_order_id INTEGER(11),
        IN in_stock_id INTEGER(11),
        IN in_shooting_date DATE,
        IN in_shooting_time TIME,
        IN in_child_count INTEGER(11),
        INOUT shooting_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(shooting_id) THEN
        INSERT INTO `shootings` (`id`, `manager_id`, `order_id`,
        	`stock_id`, `shooting_date`, `shooting_time`, `child_count`) 
    	VALUES (NULL, in_manager_id, in_order_id, 
        	in_stock_id, in_shooting_date, in_shooting_time, in_child_count);
		SET shooting_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `shootings` SET manager_id=in_manager_id, order_id=in_order_id, 
        	 stock_id=in_stock_id, shooting_date=in_shooting_date, 
             shooting_time=in_shooting_time, child_count=in_child_count  
        WHERE id=shooting_id;
    END IF;
END;

#
# Definition for the `add_update_state` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_state`(
        IN in_state_name VARCHAR(255),
        INOUT state_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(state_id) THEN
        INSERT INTO `states` (`id`, `state_name`) 
    	VALUES (NULL, in_state_name);
		SET state_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `states` SET state_name=in_state_name 
        WHERE id=state_id;
    END IF;
END;

#
# Definition for the `add_update_stock` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_update_stock`(
        IN in_code VARCHAR(10),
        IN in_stock_name VARCHAR(100),
        INOUT stock_id INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF ISNULL(stock_id) THEN
        INSERT INTO `stocks` (`id`, `code`, `stock_name`) 
    	VALUES (NULL, in_code, in_stock_name);
		SET stock_id = LAST_INSERT_ID();
    ELSE
    	UPDATE `stocks` SET code=in_code, stock_name=in_stock_name 
        WHERE id=stock_id;
    END IF;
END;

#
# Definition for the `add_user` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `add_user`(
        IN in_user_name VARCHAR(30),
        IN in_password VARCHAR(128)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	DECLARE ucount INTEGER;
    SET @ucount=0;
    SELECT COUNT(*) INTO @ucount FROM users where 
    username=in_user_name;
    IF (@ucount=0) THEN
    INSERT INTO `users` 
    (`username`, `password`, `email`, `isactive`)                                 
    VALUES (in_user_name, in_password, 'psdevelop@yandex.ru', 1);
    END IF;
END;

#
# Definition for the `delete_object_by_type` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `delete_object_by_type`(
        IN OBJ_TYPE VARCHAR(50),
        IN OBJ_ID INTEGER(11),
        OUT OBJ_COUNT INTEGER(11)
    )
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	IF (OBJ_TYPE="person") THEN
    	UPDATE persons SET closed=1 WHERE id=OBJ_ID;
    ELSE
    	IF (OBJ_TYPE="plot") THEN
       		UPDATE plots SET closed=1 WHERE id=OBJ_ID; 
        ELSE
        	IF (OBJ_TYPE="stock") THEN
            	UPDATE stocks SET closed=1 WHERE id=OBJ_ID;
    		ELSE
            	IF OBJ_TYPE="kg" THEN
                	UPDATE `kinder_gartens` SET closed=1 WHERE id=OBJ_ID;
                ELSE
                	IF OBJ_TYPE="call" THEN
                    	UPDATE calls SET closed=1 WHERE id=OBJ_ID;
                    ELSE
                    	IF OBJ_TYPE="order" THEN
                        	UPDATE orders SET closed=1 WHERE id=OBJ_ID;
                        ELSE
                        	IF OBJ_TYPE="meeting" THEN
                            	UPDATE meetings SET closed=1 WHERE id=OBJ_ID;
                            ELSE
                            	IF OBJ_TYPE="meeting_result" THEN
                                	UPDATE meeting_results SET closed=1 WHERE id=OBJ_ID;
                                ELSE
                                	IF OBJ_TYPE="shooting" THEN
                                    	UPDATE shootings SET closed=1 WHERE id=OBJ_ID;
    								END IF;
    							END IF;
    						END IF;
    					END IF;
    				END IF;
    			END IF;
            END IF;
    	END IF;
    END IF;
    
    IF OBJ_TYPE="meeting_result_type" THEN
    	UPDATE meeting_results_types SET closed=1 WHERE id=OBJ_ID;
    ELSE
    	IF OBJ_TYPE="call_status" THEN
        	UPDATE call_statuses SET closed=1 WHERE id=OBJ_ID;
        ELSE
        	IF OBJ_TYPE="person_type" THEN
            	UPDATE person_types SET closed=1 WHERE id=OBJ_ID;
            ELSE
            	IF OBJ_TYPE="user" THEN
            		UPDATE users SET isactive=0 WHERE id=OBJ_ID;
                END IF;
    		END IF;
    	END IF;
    END IF;
      
END;

#
# Definition for the `insert_sample_data` procedure : 
#

CREATE DEFINER = 'root'@'localhost' PROCEDURE `insert_sample_data`()
    NOT DETERMINISTIC
    CONTAINS SQL
    SQL SECURITY DEFINER
    COMMENT ''
BEGIN
	call `add_person_by_type` (2,@pid,'Иван','Иванов','Иванович',
		'8-86133-00000','8-918-0000000',NULL);
    call `add_person_by_type` (1,@pid,'Сидор','Сидоров','Сидорович',
		'8-495-0000000','8-916-0000000',NULL);
    call `add_person_by_type` (2,@pid,'Петр','Петров','Петрович',
		'8-86133-00000','8-928-0000000',NULL);
	select @pid;
    call `add_update_plot`('А','Африка',@pl_id);
    SET @pl_id=NULL;
    call `add_update_plot`('А-В','Африка-Весна',@pl_id);
    SET @pl_id=NULL;
    call `add_update_plot`('А-Г','Африка-Голуби',@pl_id);
    call `add_update_stock`(NULL,'Плакат',@st_id);
	SET @st_id=NULL;
	call `add_update_stock`(NULL,'Баннер',@st_id);
	SET @st_id=NULL;
	call `add_update_stock`(NULL,'Календарь',@st_id);
	SET @st_id=NULL;
	call `add_update_stock`(NULL,'Магнит',@st_id);
    call `add_update_call_status`('Дозвон',@call_st_id);
	SET @call_st_id=NULL;
	call `add_update_call_status`('Отказ',@call_st_id);
    call `add_update_kg`('1','Алексеевский','ул. Мира, д.1','2-34-34','Иванова М.И.',
		'Новый',@kg_id);
	SET @kg_id=NULL;
	call `add_update_kg`('2','Ивановский','ул. Чапаева, д.1','1-11-11','Петрова С.А.',
		'Постоянный',@kg_id);
    call `add_update_meeting_result_type`('Индив.случай',@mrt_id);
	SET @mrt_id=NULL;
	call `add_update_meeting_result_type`('Отказ',@mrt_id);
	SET @mrt_id=NULL;
	call `add_update_meeting_result_type`('Перезвон',@mrt_id);
	SET @mrt_id=NULL;
	call `add_update_meeting_result_type`('Перенос встречи',@mrt_id);
	SET @mrt_id=NULL;
	call `add_update_meeting_result_type`('Съемка',@mrt_id);
    
    call `add_update_call`(4, 1, 1, '2011-08-31 15:00:00', @call_id);
    call `add_update_meeting`(4, 1, 3, '2011-09-02', '13:00:00', @meeting_id);
    
END;

#
# Definition for the `districts_with_relative` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `districts_with_relative` AS 
  select 
    `ds`.`id` AS `id`,
    `ds`.`closed` AS `closed`,
    `ds`.`district_name` AS `district_name`,
    `ds`.`state_id` AS `state_id`,
    concat(`ds`.`district_name`,' ',`stt`.`state_name`) AS `district_st_name` 
  from 
    (`districts` `ds` join `states` `stt`) 
  where 
    (`ds`.`state_id` = `stt`.`id`) 
  order by 
    `ds`.`id` desc;

#
# Definition for the `kg_with_relative` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kg_with_relative` AS 
  select 
    `kg`.`id` AS `id`,
    `kg`.`closed` AS `closed`,
    `kg`.`code` AS `code`,
    `kg`.`kg_area` AS `kg_area`,
    `kg`.`kg_adress` AS `kg_adress`,
    `kg`.`kg_phones` AS `kg_phones`,
    `kg`.`kg_contact_person` AS `kg_contact_person`,
    `kg`.`kg_status` AS `kg_status`,
    `kg`.`kg_comment` AS `kg_comment`,
    `kg`.`district_id` AS `district_id`,
    `kg`.`email` AS `email`,
    `f_get_kg_without_stocks_names`(`kg`.`id`) AS `kg_stocks_info`,
    concat(if(isnull(`kg`.`district_id`),'',`dst_w_r`.`district_st_name`),ifnull(`kg`.`code`,' '),' ',ifnull(`kg`.`kg_area`,' '),' ',ifnull(`kg`.`kg_adress`,' '),' ',ifnull(`kg`.`kg_phones`,' '),' ',ifnull(`kg`.`kg_contact_person`,' ')) AS `kg_name` 
  from 
    (`kinder_gartens` `kg` left join `districts_with_relative` `dst_w_r` on((`kg`.`district_id` = `dst_w_r`.`id`))) 
  order by 
    `kg`.`id` desc;

#
# Definition for the `person_with_types` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `person_with_types` AS 
  select 
    `pt`.`person_type_name` AS `person_type_name`,
    `p`.`id` AS `id`,
    `p`.`closed` AS `closed`,
    `p`.`person_type_id` AS `person_type_id`,
    `p`.`code` AS `person_code`,
    `p`.`first_name` AS `first_name`,
    `p`.`last_name` AS `last_name`,
    `p`.`sur_name` AS `sur_name`,
    `p`.`employment_date` AS `employment_date`,
    `p`.`dismissal_date` AS `dismissal_date`,
    `p`.`stationare_phones` AS `stationare_phones`,
    `p`.`mobile_phones` AS `mobile_phones`,
    concat(ifnull(`p`.`last_name`,' '),' ',ifnull(`p`.`first_name`,' '),' ',ifnull(`p`.`sur_name`,' ')) AS `person_name` 
  from 
    (`persons` `p` left join `person_types` `pt` on((`p`.`person_type_id` = `pt`.`id`))) 
  order by 
    `p`.`id` desc;

#
# Definition for the `calls_with_relative` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `calls_with_relative` AS 
  select 
    `cl`.`call_date` AS `call_date`,
    `cl`.`id` AS `id`,
    `cl`.`closed` AS `closed`,
    `cl`.`call_status_id` AS `call_status_id`,
    `cl`.`kg_id` AS `kg_id`,
    `cl`.`operator_id` AS `operator_id`,
    `cl_st`.`call_status_name` AS `call_status_name`,
    `f_get_call_statuses_names`(`cl`.`id`) AS `all_call_statuses_names`,
    `cl`.`calls_comment` AS `calls_comment`,
    `p_w_t`.`person_code` AS `operator_code`,
    `p_w_t`.`first_name` AS `operator_first_name`,
    `p_w_t`.`last_name` AS `operator_last_name`,
    `p_w_t`.`sur_name` AS `operator_surname`,
    `p_w_t`.`mobile_phones` AS `operator_mobile_phones`,
    `p_w_t`.`stationare_phones` AS `operator_st_phones`,
    `kg`.`code` AS `kg_code`,
    `kg`.`district_id` AS `district_id`,
    `kg`.`kg_comment` AS `kg_comment`,
    `kg`.`kg_adress` AS `kg_adress`,
    `kg`.`kg_area` AS `kg_area`,
    `kg`.`kg_contact_person` AS `kg_contact_person`,
    `kg`.`kg_phones` AS `kg_phones`,
    `kg`.`kg_status` AS `kg_status`,
    `st`.`stock_name` AS `stock_name`,
    `kg`.`kg_name` AS `kg_name`,
    `st`.`id` AS `stock_id`,
    `kg`.`email` AS `email`,
    `cl`.`repeat_call_datetime` AS `repeat_call_datetime`,
    concat(ifnull(`cl`.`call_date`,' '),' ',ifnull(`st`.`stock_name`,' '),' ',ifnull(`kg`.`kg_name`,' '),' ',`p_w_t`.`person_name`) AS `call_name` 
  from 
    ((((`calls` `cl` left join `call_statuses` `cl_st` on((`cl`.`call_status_id` = `cl_st`.`id`))) left join `person_with_types` `p_w_t` on((`cl`.`operator_id` = `p_w_t`.`id`))) left join `kg_with_relative` `kg` on((`cl`.`kg_id` = `kg`.`id`))) left join `stocks` `st` on((`cl`.`stock_id` = `st`.`id`))) 
  order by 
    `cl`.`id` desc;

#
# Definition for the `meetings_with_relative` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `meetings_with_relative` AS 
  select 
    `mt`.`operator_id` AS `operator_id`,
    `mt`.`manager_id` AS `manager_id`,
    `mt`.`meeting_date` AS `meeting_date`,
    `mt`.`meeting_time` AS `meeting_time`,
    `mt`.`id` AS `id`,
    `mt`.`closed` AS `closed`,
    `manag_pers`.`person_name` AS `manager_name`,
    `oper_pers`.`person_name` AS `operator_name`,
    `cl_w_r`.`call_name` AS `call_name`,
    `cl_w_r`.`id` AS `call_id`,
    `cl_w_r`.`district_id` AS `district_id`,
    `cl_w_r`.`kg_id` AS `kg_id`,
    `mt`.`meeting_result_type_id` AS `meeting_result_type_id`,
    `mrts`.`meeting_result_type_name` AS `meeting_result_type_name`,
    `f_get_meeting_statuses_names`(`mt`.`id`) AS `meeting_statuses_names`,
    concat(ifnull(`mt`.`meeting_date`,'---'),' ',ifnull(`mt`.`meeting_time`,'---'),' ',`manag_pers`.`person_name`,' ',`oper_pers`.`person_name`) AS `meeting_name` 
  from 
    ((((`meetings` `mt` left join `person_with_types` `oper_pers` on((`mt`.`operator_id` = `oper_pers`.`id`))) left join `person_with_types` `manag_pers` on((`mt`.`manager_id` = `manag_pers`.`id`))) left join `calls_with_relative` `cl_w_r` on((`mt`.`call_id` = `cl_w_r`.`id`))) left join `meeting_results_types` `mrts` on((`mt`.`meeting_result_type_id` = `mrts`.`id`))) 
  order by 
    `mt`.`id` desc;

#
# Definition for the `meetings_results_with_relative` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `meetings_results_with_relative` AS 
  select 
    `mr`.`id` AS `id`,
    `mr`.`closed` AS `closed`,
    `mr`.`planned_shooting_date` AS `planned_shooting_date`,
    `mr`.`meeting_result_comment` AS `meeting_result_comment`,
    `mr`.`meeting_result_type_id` AS `meeting_result_type_id`,
    `mt`.`call_id` AS `call_id`,
    `mt`.`manager_id` AS `manager_id`,
    `mr`.`meeting_id` AS `meeting_id`,
    `mr`.`plot_id` AS `plot_id`,
    `mr`.`stock_id` AS `stock_id`,
    `mrt`.`meeting_result_type_name` AS `meeting_result_type_name`,
    `mt`.`meeting_name` AS `meeting_name`,
    `pl`.`plot_name` AS `plot_name`,
    `st`.`stock_name` AS `stock_name`,
    `mt`.`call_name` AS `call_name`,
    `mt`.`manager_name` AS `manager_name` 
  from 
    ((((((`meeting_results` `mr` left join `meeting_results_types` `mrt` on((`mr`.`meeting_result_type_id` = `mrt`.`id`))) left join `meetings_with_relative` `mt` on((`mr`.`meeting_id` = `mt`.`id`))) left join `plots` `pl` on((`mr`.`plot_id` = `pl`.`id`))) left join `stocks` `st` on((`mr`.`stock_id` = `st`.`id`))) left join `calls_with_relative` `cl_w_r` on((`mr`.`call_id` = `cl_w_r`.`id`))) left join `person_with_types` `p_w_t` on((`mr`.`manager_id` = `p_w_t`.`id`))) 
  order by 
    `mr`.`id` desc;

#
# Definition for the `orders_with_relative` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_with_relative` AS 
  select 
    `ords`.`id` AS `id`,
    `ords`.`closed` AS `closed`,
    `ords`.`kg_id` AS `kg_id`,
    `ords`.`manager_id` AS `manager_id`,
    `ords`.`stock_id` AS `stock_id`,
    `ords`.`shooting_date` AS `shooting_date`,
    `ords`.`shooting_time` AS `shooting_time`,
    `ords`.`order_date` AS `order_date`,
    `ords`.`planned_child_count` AS `planned_child_count`,
    `ords`.`order_comment` AS `order_comment`,
    `p_w_t`.`person_name` AS `manager_name`,
    concat(if(isnull(`ords`.`order_date`),'Без даты',`ords`.`order_date`),' ',ifnull(`kg`.`code`,' '),' ',`kg`.`kg_area`,' ',`kg`.`kg_adress`,' ',`f_get_order_plots_names`(`ords`.`id`),' ',if(isnull(`st`.`stock_name`),' ',`st`.`stock_name`)) AS `order_name`,
    `kg`.`district_id` AS `district_id`,
    `kg`.`kg_comment` AS `kg_comment`,
    `kg`.`kg_status` AS `kg_status`,
    `f_get_order_plots_names`(`ords`.`id`) AS `plot_name`,
    `st`.`code` AS `stock_code`,
    `st`.`stock_name` AS `stock_name`,
    `kg`.`kg_name` AS `kg_name`,
    `kg`.`email` AS `email`,
    `ords`.`group_count` AS `group_count`,
    `ords`.`little_group_count` AS `little_group_count`,
    `ords`.`shooting_place` AS `shooting_place`,
    `ords`.`order_status_id` AS `order_status_id`,
    `orst`.`order_status_name` AS `order_status_name`,
    `f_get_order_statuses_names`(`ords`.`id`) AS `order_statuses_names`,
    `ords`.`repeat_call_datetime` AS `repeat_call_datetime`,
    `ords`.`our_fault` AS `our_fault` 
  from 
    ((((`orders` `ords` left join `kg_with_relative` `kg` on((`ords`.`kg_id` = `kg`.`id`))) left join `stocks` `st` on((`ords`.`stock_id` = `st`.`id`))) left join `person_with_types` `p_w_t` on((`ords`.`manager_id` = `p_w_t`.`id`))) left join `order_statuses` `orst` on((`ords`.`order_status_id` = `orst`.`id`))) 
  order by 
    `ords`.`id` desc;

#
# Definition for the `shootings_with_relative` view : 
#

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `shootings_with_relative` AS 
  select 
    `sh`.`id` AS `id`,
    `sh`.`closed` AS `closed`,
    `sh`.`child_count` AS `child_count`,
    `sh`.`shooting_date` AS `shooting_date`,
    `sh`.`shooting_time` AS `shooting_time`,
    `sh`.`manager_id` AS `manager_id`,
    `sh`.`order_id` AS `order_id`,
    `sh`.`stock_id` AS `stock_id`,
    `p_w_t`.`person_name` AS `manager_name`,
    `ord_with_rel`.`order_name` AS `order_name`,
    `p_w_t`.`person_code` AS `manager_code`,
    `p_w_t`.`first_name` AS `manager_first_name`,
    `p_w_t`.`last_name` AS `manager_last_name`,
    `p_w_t`.`sur_name` AS `manager_surname`,
    `p_w_t`.`mobile_phones` AS `manager_mobile_phones`,
    `p_w_t`.`stationare_phones` AS `manager_st_phones`,
    `st`.`code` AS `stock_code`,
    `st`.`stock_name` AS `stock_name`,
    `ord_with_rel`.`order_date` AS `order_date`,
    `ord_with_rel`.`district_id` AS `district_id`,
    `sh`.`shooting_status_id` AS `shooting_status_id`,
    `shs`.`shooting_status_name` AS `shooting_status_name`,
    `sh`.`real_count` AS `real_count`,
    `sh`.`back_count` AS `back_count`,
    if(isnull(`sh`.`order_id`),'Не связан с ДС',`ord_with_rel`.`kg_name`) AS `kg_name`,
    if(isnull(`sh`.`order_id`),NULL,`ord_with_rel`.`kg_id`) AS `kg_id` 
  from 
    ((((`shootings` `sh` left join `stocks` `st` on((`sh`.`stock_id` = `st`.`id`))) left join `person_with_types` `p_w_t` on((`sh`.`manager_id` = `p_w_t`.`id`))) left join `orders_with_relative` `ord_with_rel` on((`sh`.`order_id` = `ord_with_rel`.`id`))) left join `shooting_statuses` `shs` on((`sh`.`shooting_status_id` = `shs`.`id`))) 
  order by 
    `sh`.`id` desc;

#
# Data for the `attempts` table  (LIMIT -498,500)
#

INSERT INTO `attempts` (`ip`, `count`, `expiredate`) VALUES 
  ('127.0.0.1',2,'2011-10-08 06:05:52');
COMMIT;

#
# Data for the `call_statuses` table  (LIMIT -491,500)
#

INSERT INTO `call_statuses` (`id`, `call_status_name`, `closed`) VALUES 
  (1,'Дозвон',0),
  (2,'Отказ',0),
  (5,'Встреча',0),
  (6,'Перезвон',0),
  (7,'Не дозвон',0),
  (8,'Не дозвон4',1),
  (9,'Не дозвон4',1),
  (10,'Завершено',0);
COMMIT;

#
# Data for the `call_statuses_rels` table  (LIMIT -488,500)
#

INSERT INTO `call_statuses_rels` (`id`, `call_id`, `call_status_id`, `call_date`, `closed`) VALUES 
  (1,10,2,'2011-11-17 00:54:00',0),
  (2,10,2,'2011-11-17 00:54:00',0),
  (3,10,2,'2011-11-17 01:03:00',0),
  (4,10,1,'2011-11-17 01:12:00',0),
  (5,10,2,'2011-11-17 01:12:00',0),
  (6,10,2,'2011-11-17 01:14:00',0),
  (7,10,1,'2011-11-17 01:19:00',0),
  (8,10,5,'2011-11-17 01:20:00',0),
  (9,9,2,'2011-11-17 02:02:00',0),
  (10,10,6,'2011-11-17 02:06:00',0),
  (11,9,5,'2011-11-17 02:10:00',0);
COMMIT;

#
# Data for the `calls` table  (LIMIT -494,500)
#

INSERT INTO `calls` (`id`, `operator_id`, `kg_id`, `call_status_id`, `call_date`, `closed`, `calls_comment`, `stock_id`, `repeat_call_datetime`) VALUES 
  (1,4,1,1,'2011-08-31 14:00:00',0,NULL,0,NULL),
  (4,4,1,1,'2011-10-05 14:52:03',0,'sddsrr',0,NULL),
  (9,56,1,5,'2011-11-05 09:57:13',0,NULL,2,NULL),
  (10,56,4,6,'2011-11-05 19:04:00',0,NULL,2,'2010-11-15 23:36:00'),
  (11,41,1,1,'2011-11-17 11:49:00',1,NULL,2,'2011-11-17 11:49:00');
COMMIT;

#
# Data for the `kinder_gartens` table  (LIMIT -496,500)
#

INSERT INTO `kinder_gartens` (`id`, `code`, `kg_area`, `kg_adress`, `kg_phones`, `kg_contact_person`, `kg_status`, `closed`, `district_id`, `kg_comment`, `email`) VALUES 
  (1,'1','Алексеевский','ул. Мира, д.1','2-34-34','Иванова М.И.','Новый',0,NULL,NULL,NULL),
  (2,'2','Ивановский','ул. Чапаева, д.1','1-11-11','Петрова С.А.','Постоянный',0,NULL,NULL,NULL),
  (4,'2','Ивановскийввввв','ул. Чапаева, д.1','1-11-11','Петрова С.А.','Постоянный',0,NULL,NULL,NULL);
COMMIT;

#
# Data for the `meeting_results` table  (LIMIT -487,500)
#

INSERT INTO `meeting_results` (`id`, `meeting_id`, `stock_id`, `plot_id`, `meeting_result_type_id`, `call_id`, `manager_id`, `planned_shooting_date`, `meeting_result_comment`, `closed`) VALUES 
  (1,1,2,3,2,1,2,'2011-09-23 20:55:00',NULL,0),
  (2,1,2,3,3,1,2,'2011-09-23 21:12:00',NULL,0),
  (4,1,2,3,2,1,11,'2011-09-23 21:18:00',NULL,0),
  (5,1,2,3,6,1,2,'2011-09-23 20:55:00',NULL,0),
  (6,2,2,3,2,1,3,NULL,NULL,0),
  (7,5,2,3,2,0,0,'2011-11-18 22:46:00',NULL,0),
  (8,5,2,3,2,0,0,'2011-11-18 22:51:00',NULL,0),
  (9,5,2,3,2,0,0,'2011-11-18 22:53:00',NULL,0),
  (10,5,2,3,15,0,0,NULL,NULL,0),
  (11,4,2,3,15,0,0,NULL,NULL,0),
  (12,4,3,5,15,0,0,'2011-11-18 23:31:00',NULL,0),
  (13,3,4,4,15,0,0,'2011-11-23 14:02:00',NULL,0);
COMMIT;

#
# Data for the `meeting_results_types` table  (LIMIT -492,500)
#

INSERT INTO `meeting_results_types` (`id`, `meeting_result_type_name`, `closed`) VALUES 
  (2,'Индив.случай',0),
  (3,'Отказ',0),
  (4,'Перезвон',0),
  (5,'Перенос встречи',0),
  (6,'Съемка',1),
  (15,'Заказ',0),
  (16,'Завершено',0);
COMMIT;

#
# Data for the `meetings` table  (LIMIT -494,500)
#

INSERT INTO `meetings` (`id`, `operator_id`, `call_id`, `manager_id`, `meeting_date`, `meeting_time`, `closed`, `meeting_result_type_id`) VALUES 
  (1,4,1,2,'2011-09-23','01:33:00',0,0),
  (2,4,1,3,'2011-09-23','10:33:00',0,0),
  (3,56,10,0,NULL,NULL,0,15),
  (4,56,10,0,NULL,NULL,0,15),
  (5,56,9,0,NULL,NULL,0,15);
COMMIT;

#
# Data for the `order_statuses` table  (LIMIT -492,500)
#

INSERT INTO `order_statuses` (`id`, `order_status_name`, `closed`) VALUES 
  (1,'Подтверждена съемка',0),
  (2,'Выполнение',0),
  (3,'Контрольный звонок',0),
  (4,'Отказ съемки',0),
  (5,'Перенос на дату',0),
  (6,'Перенос с уточн.',0),
  (7,'Завершено',0);
COMMIT;

#
# Data for the `order_statuses_rels` table  (LIMIT -495,500)
#

INSERT INTO `order_statuses_rels` (`id`, `order_id`, `order_status_id`, `order_date`, `closed`) VALUES 
  (1,13,1,'2011-11-18 23:53:00',0),
  (2,13,2,'2011-11-19 00:31:00',0),
  (3,12,1,'2011-11-19 23:43:24',0),
  (4,11,3,'2011-11-19 23:44:16',0);
COMMIT;

#
# Data for the `orders` table  (LIMIT -486,500)
#

INSERT INTO `orders` (`id`, `kg_id`, `manager_id`, `stock_id`, `order_date`, `shooting_date`, `shooting_time`, `planned_child_count`, `order_comment`, `closed`, `shooting_place`, `group_count`, `little_group_count`, `order_status_id`, `repeat_call_datetime`, `our_fault`) VALUES 
  (1,1,3,2,'2011-09-21 23:00:00',NULL,NULL,0,NULL,0,NULL,0,0,0,NULL,'0'),
  (3,1,8,3,'2011-09-23 22:26:00','2011-09-23','23:26:00',NULL,NULL,0,NULL,0,0,0,NULL,'0'),
  (4,1,2,2,NULL,NULL,NULL,NULL,'asdfgh',0,NULL,0,0,0,NULL,'0'),
  (5,2,3,0,'2011-10-12 21:05:37','2011-10-12','22:05:37',0,'',2,NULL,0,0,0,NULL,'0'),
  (6,2,3,0,'2011-10-12 21:06:44','2011-10-12','22:06:44',0,'',2,NULL,0,0,0,NULL,'0'),
  (7,2,14,2,'2011-11-05 19:17:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,'0'),
  (8,2,14,2,'2011-11-05 19:20:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,'0'),
  (9,2,14,5,'2011-11-05 19:30:00',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,'0'),
  (10,1,0,2,'2011-11-18 23:03:53',NULL,NULL,0,'',0,'',0,0,0,NULL,'0'),
  (11,1,0,2,'2011-11-18 23:06:58',NULL,NULL,0,'',0,'',0,0,3,NULL,'0'),
  (12,4,0,2,'2011-11-18 23:12:15',NULL,NULL,0,'',0,'',0,0,1,'2011-11-19 19:20:00','0'),
  (13,4,0,3,'2011-11-18 23:32:19','2011-11-18','23:31:00',0,'',0,'',0,0,2,'2011-11-19 19:19:00','1'),
  (14,4,0,4,'2011-11-23 14:03:38','2011-11-23','14:02:00',0,'',0,'',0,0,0,NULL,'0');
COMMIT;

#
# Data for the `orders_plots_rels` table  (LIMIT -490,500)
#

INSERT INTO `orders_plots_rels` (`plot_id`, `order_id`, `id`, `child_count`, `closed`) VALUES 
  (3,6,1,0,0),
  (3,6,2,0,0),
  (3,5,3,0,0),
  (4,6,4,0,0),
  (4,5,5,0,0),
  (3,9,6,0,0),
  (5,8,7,0,0),
  (5,13,8,0,0),
  (4,14,9,0,0);
COMMIT;

#
# Data for the `person_types` table  (LIMIT -497,500)
#

INSERT INTO `person_types` (`id`, `person_type_name`, `closed`) VALUES 
  (1,'Оператор',0),
  (2,'Менеджер',0);
COMMIT;

#
# Data for the `persons` table  (LIMIT -476,500)
#

INSERT INTO `persons` (`id`, `code`, `person_type_id`, `first_name`, `last_name`, `sur_name`, `stationare_phones`, `mobile_phones`, `employment_date`, `dismissal_date`, `closed`, `uid`) VALUES 
  (2,'2',2,'Андрей','Андреев','Андреевич','Не заданы','Не заданы','2011-09-23 23:30:53','2011-09-14 23:00:00',0,0),
  (3,'3',2,'Максим','Максимов','Максимович','8-86133-00000','8-918-0000000','2011-08-28 22:32:21',NULL,0,0),
  (4,'4',1,'Сидор','Сидоров','Сидорович','8-495-0000000','8-916-0000000','2011-08-28 22:32:21',NULL,0,0),
  (8,'8',2,'Петр','Петров','Петрович','8-86133-00000','8-928-0000000','2011-08-28 22:45:19',NULL,0,0),
  (9,'9',2,'Владимир','Владимиров','Владимирович','8-86133-00000','8-918-0000000','2011-09-11 12:32:44',NULL,0,0),
  (10,'10',2,'Иванов','Иванов','Иванович','8-86133-00000','8-918-0000000','2011-09-11 12:54:35',NULL,0,0),
  (11,'11',2,'Игнат','Игнатов','Игнатович','8-86133-00000','8-918-0000000','2011-09-11 12:55:40',NULL,0,0),
  (12,'12',2,'Глеб','Глебов','Глебович','8-86133-00000','8-918-0000000','2011-09-11 12:56:26',NULL,0,0),
  (13,'13',2,'Борис','Борисов','Борисович',NULL,NULL,'2011-09-11 12:57:57',NULL,0,0),
  (14,'14',2,'Алексей','Алексеев','Алексеевич',NULL,NULL,'2011-09-11 13:03:04',NULL,0,0),
  (15,'15',1,'Николай','Николаев','Николаевич',NULL,NULL,'2011-09-11 13:04:00',NULL,0,0),
  (16,'16',1,'Михаил','Михайлов','Михайлович',NULL,NULL,'2011-09-11 13:12:45',NULL,0,0),
  (17,'17',1,'Виктор','Викторов','Викторович',NULL,NULL,'2011-09-11 13:13:41',NULL,0,0),
  (18,'18',1,'Сергей','Сергеев','Сергеевич',NULL,NULL,'2011-09-11 13:14:31',NULL,0,0),
  (41,'41',1,'Александр','Александров','Александрович',NULL,NULL,'2011-09-22 18:15:06',NULL,0,0),
  (49,'49',1,'dd','ddd','dd',NULL,NULL,'2011-10-06 05:46:46',NULL,1,0),
  (50,'50',1,'dd','ddddfff','dd',NULL,NULL,'2011-10-06 05:47:24',NULL,1,0),
  (51,'51',1,'ввв','ыыыы','ввв',NULL,NULL,'2011-10-06 06:46:15',NULL,1,0),
  (52,'52',1,'ааа','ыывв','ппп',NULL,NULL,'2011-10-06 06:48:42',NULL,1,0),
  (53,'53',1,'кк','ввв','ее',NULL,NULL,'2011-10-06 08:28:10',NULL,1,0),
  (54,'54',1,'пп','аа','666',NULL,NULL,'2011-10-06 08:30:38',NULL,1,0),
  (55,'55',1,'пкуу','кк','купук',NULL,NULL,'2011-10-06 08:35:58',NULL,1,0),
  (56,'56',1,'еее','еееее','нннн',NULL,NULL,'2011-10-06 09:03:52',NULL,1,0);
COMMIT;

#
# Data for the `plots` table  (LIMIT -496,500)
#

INSERT INTO `plots` (`id`, `code`, `plot_name`, `closed`) VALUES 
  (3,'А','Африка',0),
  (4,'А-В','Африка-Весна',0),
  (5,'А-Г','Африка-Голуби',0);
COMMIT;

#
# Data for the `sessions` table  (LIMIT -461,500)
#

INSERT INTO `sessions` (`id`, `uid`, `username`, `hash`, `expiredate`, `ip`) VALUES 
  (17,0,'root','---','2011-10-08 05:51:59','127.0.0.1'),
  (18,0,'root','---','2011-10-08 06:06:44','127.0.0.1'),
  (19,0,'root','---','2011-10-08 07:57:39','127.0.0.1'),
  (20,0,'root','---','2011-10-12 15:17:10','127.0.0.1'),
  (21,0,'root','---','2011-10-13 17:08:42','127.0.0.1'),
  (22,0,'root','---','2011-11-01 07:58:49','127.0.0.1'),
  (23,0,'root','---','2011-11-01 08:04:13','127.0.0.1'),
  (24,0,'root','---','2011-11-01 08:10:13','127.0.0.1'),
  (25,0,'root','---','2011-11-01 17:21:13','127.0.0.1'),
  (26,0,'root','---','2011-11-01 17:29:30','127.0.0.1'),
  (27,0,'root','---','2011-11-01 17:32:44','127.0.0.1'),
  (28,0,'root','---','2011-11-01 17:57:42','127.0.0.1'),
  (29,0,'root','---','2011-11-01 17:58:08','127.0.0.1'),
  (30,0,'root','---','2011-11-01 18:11:29','127.0.0.1'),
  (31,0,'root','---','2011-11-02 00:16:00','127.0.0.1'),
  (32,0,'root','---','2011-11-02 00:21:43','127.0.0.1'),
  (33,0,'root','---','2011-11-02 03:26:27','127.0.0.1'),
  (34,0,'root','---','2011-11-03 21:34:49','127.0.0.1'),
  (35,0,'root','---','2011-11-04 19:09:52','127.0.0.1'),
  (36,0,'root','---','2011-11-04 19:55:31','127.0.0.1'),
  (37,0,'root','---','2011-11-05 00:06:13','127.0.0.1'),
  (38,0,'root','---','2011-11-05 00:34:13','127.0.0.1'),
  (39,0,'root','---','2011-11-05 16:57:49','127.0.0.1'),
  (40,0,'root','---','2011-11-05 19:37:11','127.0.0.1'),
  (41,0,'root','---','2011-11-05 19:39:34','127.0.0.1'),
  (42,0,'root','---','2011-11-07 11:29:25','127.0.0.1'),
  (43,0,'root','---','2011-11-15 23:04:28','127.0.0.1'),
  (44,0,'root','---','2011-11-16 23:50:25','127.0.0.1'),
  (45,0,'root','---','2011-11-17 20:17:43','127.0.0.1'),
  (46,0,'root','---','2011-11-18 22:45:46','127.0.0.1'),
  (47,0,'root','---','2011-11-19 16:23:26','127.0.0.1'),
  (48,0,'root','---','2011-11-19 22:53:12','127.0.0.1'),
  (49,0,'root','---','2011-11-20 14:53:34','127.0.0.1'),
  (50,0,'root','---','2011-11-21 22:16:42','127.0.0.1'),
  (51,0,'root','---','2011-11-22 00:55:49','127.0.0.1'),
  (52,0,'root','---','2011-11-22 01:44:45','127.0.0.1'),
  (53,0,'root','---','2011-11-22 11:30:45','127.0.0.1'),
  (54,0,'root','---','2011-11-23 13:48:02','127.0.0.1');
COMMIT;

#
# Data for the `shootings` table  (LIMIT -493,500)
#

INSERT INTO `shootings` (`id`, `shooting_date`, `shooting_time`, `order_id`, `manager_id`, `stock_id`, `child_count`, `closed`, `kg_id`, `shooting_status_id`, `real_count`, `back_count`) VALUES 
  (1,NULL,NULL,1,3,2,NULL,0,NULL,0,0,0),
  (2,'2011-09-23','17:54:00',1,3,2,NULL,0,NULL,0,0,0),
  (4,'2011-10-12','22:05:38',5,3,0,0,2,2,0,0,0),
  (5,'2011-10-12','22:06:44',6,3,0,0,2,2,0,0,0),
  (6,'2011-10-13','17:25:00',3,14,2,2,0,NULL,0,0,0),
  (7,'2011-11-18','23:31:00',13,0,3,0,0,4,0,50,0);
COMMIT;

#
# Data for the `stocks` table  (LIMIT -495,500)
#

INSERT INTO `stocks` (`id`, `code`, `stock_name`, `closed`) VALUES 
  (2,NULL,'Плакат',0),
  (3,NULL,'Баннер',0),
  (4,NULL,'Календарь',0),
  (5,NULL,'Магнит',0);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;