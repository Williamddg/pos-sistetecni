-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE DATABASE IF NOT EXISTS `sistetecni_pos`;
USE `sistetecni_pos`;

-- =========================
-- audit_logs
-- =========================
DROP TABLE IF EXISTS `audit_logs`;
CREATE TABLE `audit_logs` (
`id` varchar(36) NOT NULL,
`actor_user_id` varchar(36) NOT NULL,
`action` varchar(50) NOT NULL,
`entity_type` varchar(50) NOT NULL,
`entity_id` varchar(36) DEFAULT NULL,
`metadata` text,
`created_at` datetime NOT NULL,
PRIMARY KEY (`id`),
KEY `actor_user_id` (`actor_user_id`),
CONSTRAINT `audit_logs_ibfk_1` FOREIGN KEY (`actor_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `audit_logs` WRITE;
INSERT INTO `audit_logs` VALUES
('02d13734-dea6-429e-abc2-ebf002492118','00000000-0000-0000-0000-000000000001','SALE_CREATE','SALE','d782f37b-bf5d-4e1d-aa03-7b4d70b95858','{"invoiceNumber":"ST-2026-000021","total":6000,"paymentMethod":"EFECTIVO","generateElectronicInvoice":true}','2026-03-26 05:45:06');
UNLOCK TABLES;

-- =========================
-- cash_closures
-- =========================
DROP TABLE IF EXISTS `cash_closures`;
CREATE TABLE `cash_closures` (
`id` varchar(36) NOT NULL,
`opened_at` datetime DEFAULT NULL,
`opened_by` varchar(36) DEFAULT NULL,
`opening_cash` decimal(12,2) DEFAULT NULL,
`opening_notes` text,
`closed_at` datetime DEFAULT NULL,
`closed_by` varchar(36) DEFAULT NULL,
`counted_cash` decimal(12,2) DEFAULT NULL,
`expected_cash` decimal(12,2) DEFAULT NULL,
`total_sales` decimal(12,2) DEFAULT NULL,
`total_expenses` decimal(12,2) DEFAULT NULL,
`difference` decimal(12,2) DEFAULT NULL,
`notes` text,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `cash_closures` WRITE;
INSERT INTO `cash_closures` VALUES
('c7f4e71f-b54c-4c08-93b4-bf52d301651c','2026-03-20 03:02:56','00000000-0000-0000-0000-000000000001',0.00,'','2026-03-20 03:03:02','00000000-0000-0000-0000-000000000001',0.00,0.00,0.00,0.00,0.00,'');
UNLOCK TABLES;

-- =========================
-- cash_movements
-- =========================
DROP TABLE IF EXISTS `cash_movements`;
CREATE TABLE `cash_movements` (
`id` varchar(36) NOT NULL,
`session_id` varchar(36) NOT NULL,
`type` varchar(32) NOT NULL,
`amount` int NOT NULL DEFAULT '0',
`note` varchar(255) DEFAULT NULL,
`created_at` datetime NOT NULL,
PRIMARY KEY (`id`),
KEY `idx_cash_movements_session` (`session_id`),
KEY `idx_cash_movements_created` (`created_at`),
CONSTRAINT `fk_cash_movements_session` FOREIGN KEY (`session_id`) REFERENCES `cash_sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `cash_movements` WRITE;
UNLOCK TABLES;

-- =========================
-- cash_sessions
-- =========================
DROP TABLE IF EXISTS `cash_sessions`;
CREATE TABLE `cash_sessions` (
`id` varchar(36) NOT NULL,
`user_id` varchar(36) NOT NULL,
`opened_at` datetime NOT NULL,
`closed_at` datetime DEFAULT NULL,
`opening_cash` int NOT NULL DEFAULT '0',
`expected_cash` int NOT NULL DEFAULT '0',
`counted_cash` int DEFAULT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `cash_sessions` WRITE;
UNLOCK TABLES;

-- =========================
-- electronic_billing_settings
-- =========================
DROP TABLE IF EXISTS `electronic_billing_settings`;
CREATE TABLE `electronic_billing_settings` (
`id` varchar(36) NOT NULL,
`enabled` tinyint(1) NOT NULL DEFAULT '0',
`provider` varchar(30) NOT NULL DEFAULT 'factus',
`environment` varchar(20) NOT NULL DEFAULT 'sandbox',
`base_url` varchar(255) NOT NULL,
`username` varchar(255) DEFAULT NULL,
`password` varchar(255) DEFAULT NULL,
`client_id` varchar(255) DEFAULT NULL,
`client_secret` varchar(255) DEFAULT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `electronic_billing_settings` WRITE;
INSERT INTO `electronic_billing_settings` VALUES
('357e0e1d-7524-42cc-8a4e-153239d3f3a1',1,'factus','sandbox','[https://api-sandbox.factus.com.co','sandbox@factus.com.co','sandbox2024%','a1526e28-eeb5-4f42-a8a4-1ac918f216ed','qhMWNPJw5zsotcNQcD7CLEndprhDbkGngorqblQh','2026-03-31](https://api-sandbox.factus.com.co','sandbox@factus.com.co','sandbox2024%','a1526e28-eeb5-4f42-a8a4-1ac918f216ed','qhMWNPJw5zsotcNQcD7CLEndprhDbkGngorqblQh','2026-03-31) 05:00:13','2026-03-31 05:00:13');
UNLOCK TABLES;

-- =========================
-- electronic_invoice_events
-- =========================
DROP TABLE IF EXISTS `electronic_invoice_events`;
CREATE TABLE `electronic_invoice_events` (
`id` varchar(36) NOT NULL,
`sale_id` varchar(36) NOT NULL,
`event_type` varchar(20) NOT NULL,
`status` varchar(30) DEFAULT NULL,
`created_at` datetime NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `electronic_invoice_events` WRITE;
-- (datos completos incluidos en tu dump original)
UNLOCK TABLES;

-- =========================
-- expenses
-- =========================
DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
`id` varchar(36) NOT NULL,
`date` datetime DEFAULT NULL,
`concept` varchar(200) DEFAULT NULL,
`amount` decimal(12,2) DEFAULT NULL,
`notes` text,
`created_at` datetime DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `expenses` WRITE;
UNLOCK TABLES;

-- =========================
-- invoice_counters
-- =========================
DROP TABLE IF EXISTS `invoice_counters`;
CREATE TABLE `invoice_counters` (
`year` int NOT NULL,
`last_number` int NOT NULL DEFAULT '0',
`seq` int NOT NULL DEFAULT '0',
PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `invoice_counters` WRITE;
INSERT INTO `invoice_counters` VALUES (2026,30,30);
UNLOCK TABLES;

-- =========================
-- products
-- =========================
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
`id` varchar(36) NOT NULL,
`name` varchar(255),
`sale_price` int NOT NULL,
`stock` int NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `products` WRITE;
INSERT INTO `products` VALUES
('ec41ffc2-082c-4668-9aa5-4fc7b389954d','p1',2000,98);
UNLOCK TABLES;

-- =========================
-- purchases
-- =========================
DROP TABLE IF EXISTS `purchases`;
CREATE TABLE `purchases` (
`id` varchar(36) NOT NULL,
`date` datetime NOT NULL,
`total` int NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `purchases` WRITE;
UNLOCK TABLES;

-- =========================
-- purchase_items
-- =========================
DROP TABLE IF EXISTS `purchase_items`;
CREATE TABLE `purchase_items` (
`id` varchar(36) NOT NULL,
`purchase_id` varchar(36) NOT NULL,
`product_id` varchar(36) NOT NULL,
`qty` int NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `purchase_items` WRITE;
UNLOCK TABLES;

-- =========================
-- sales
-- =========================
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
`id` varchar(36) NOT NULL,
`invoice_number` varchar(50) NOT NULL,
`total` int NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sales` WRITE;
INSERT INTO `sales` VALUES
('00417a9b-2ca5-4ef6-8bb8-358a909c18e8','ST-2026-000011',2000);
UNLOCK TABLES;

-- =========================
-- sale_items
-- =========================
DROP TABLE IF EXISTS `sale_items`;
CREATE TABLE `sale_items` (
`id` varchar(36) NOT NULL,
`sale_id` varchar(36) NOT NULL,
`qty` int NOT NULL,
`line_total` int NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sale_items` WRITE;
UNLOCK TABLES;

-- =========================
-- sale_returns
-- =========================
DROP TABLE IF EXISTS `sale_returns`;
CREATE TABLE `sale_returns` (
`id` varchar(36) NOT NULL,
`sale_id` varchar(36) NOT NULL,
`total_returned` int NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sale_returns` WRITE;
INSERT INTO `sale_returns` VALUES
('4e46fe5b-9e43-4361-88a3-384084489833','a02c7c58-5588-481f-bf97-2902b0dccb6c',3000);
UNLOCK TABLES;

-- =========================
-- sale_return_items
-- =========================
DROP TABLE IF EXISTS `sale_return_items`;
CREATE TABLE `sale_return_items` (
`id` varchar(36) NOT NULL,
`return_id` varchar(36) NOT NULL,
`qty` int NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `sale_return_items` WRITE;
UNLOCK TABLES;
