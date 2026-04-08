-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';

CREATE DATABASE IF NOT EXISTS sistetecni_pos
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;

USE sistetecni_pos;

CREATE USER IF NOT EXISTS 'pos_user'@'localhost' IDENTIFIED BY 'admin';
CREATE USER IF NOT EXISTS 'pos_user'@'%' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON sistetecni_pos.* TO 'pos_user'@'localhost';
GRANT ALL PRIVILEGES ON sistetecni_pos.* TO 'pos_user'@'%';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `audit_logs`;
DROP TABLE IF EXISTS `sale_return_items`;
DROP TABLE IF EXISTS `sale_returns`;
DROP TABLE IF EXISTS `sale_items`;
DROP TABLE IF EXISTS `sales`;
DROP TABLE IF EXISTS `cash_movements`;
DROP TABLE IF EXISTS `cash_sessions`;
DROP TABLE IF EXISTS `cash_closures`;
DROP TABLE IF EXISTS `purchase_items`;
DROP TABLE IF EXISTS `purchases`;
DROP TABLE IF EXISTS `expenses`;
DROP TABLE IF EXISTS `invoice_counters`;
DROP TABLE IF EXISTS `suspended_sale_items`;
DROP TABLE IF EXISTS `suspended_sales`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `suppliers`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `must_change_password` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Admin: admin@sistetecni.com / Admin123*
INSERT INTO `users` VALUES
('00000000-0000-0000-0000-000000000001','Administrador','admin@sistetecni.com',
 '$2a$10$llUv.4oV0n4sH1mP45QyJemb4iyHq74pzDfGSpDj8pkPWnj9kepvK','ADMIN',
 NOW(),0);

CREATE TABLE `products` (
  `id` varchar(36) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `cpu` varchar(255) NOT NULL,
  `ram_gb` int NOT NULL,
  `storage` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `purchase_price` int NOT NULL,
  `sale_price` int NOT NULL,
  `stock` int NOT NULL,
  `notes` text,
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(120) DEFAULT NULL,
  `sku` varchar(64) DEFAULT NULL,
  `barcode` varchar(64) DEFAULT NULL,
  `unit` varchar(20) NOT NULL DEFAULT 'UND',
  `min_stock` int NOT NULL DEFAULT '0',
  `status` varchar(20) NOT NULL DEFAULT 'ACTIVE',
  `location` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_products_barcode` (`barcode`),
  KEY `idx_products_sku` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `suppliers` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `phone` varchar(80) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text,
  `notes` text,
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_suppliers_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sales` (
  `id` varchar(36) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `subtotal` int NOT NULL,
  `discount` int NOT NULL,
  `total` int NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sale_items` (
  `id` varchar(36) NOT NULL,
  `sale_id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `qty` int NOT NULL,
  `unit_price` int NOT NULL,
  `line_total` int NOT NULL,
  `description` text,
  `unit_cost` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `sale_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`),
  CONSTRAINT `sale_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sale_returns` (
  `id` varchar(36) NOT NULL,
  `sale_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `reason` text,
  `total_returned` int NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sale_returns_sale_id` (`sale_id`),
  KEY `idx_sale_returns_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sale_return_items` (
  `id` varchar(36) NOT NULL,
  `return_id` varchar(36) NOT NULL,
  `sale_item_id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `qty` int NOT NULL,
  `unit_price` int NOT NULL,
  `line_total` int NOT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `idx_sale_return_items_return_id` (`return_id`),
  KEY `idx_sale_return_items_sale_item_id` (`sale_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  PRIMARY KEY (`id`),
  KEY `idx_cash_sessions_opened` (`opened_at`),
  KEY `idx_cash_sessions_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `expenses` (
  `id` varchar(36) NOT NULL,
  `date` datetime DEFAULT NULL,
  `concept` varchar(200) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `notes` text,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `invoice_counters` (
  `year` int NOT NULL,
  `last_number` int NOT NULL DEFAULT '0',
  `seq` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `invoice_counters` VALUES (2026, 0, 0);

CREATE TABLE `purchases` (
  `id` varchar(36) NOT NULL,
  `supplier_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) NOT NULL,
  `invoice_ref` varchar(120) DEFAULT NULL,
  `date` datetime NOT NULL,
  `subtotal` int NOT NULL DEFAULT '0',
  `total` int NOT NULL DEFAULT '0',
  `notes` text,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_purchases_date` (`date`),
  KEY `idx_purchases_supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `purchase_items` (
  `id` varchar(36) NOT NULL,
  `purchase_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `qty` int NOT NULL,
  `unit_cost` int NOT NULL,
  `line_total` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_purchase_items_purchase_id` (`purchase_id`),
  KEY `idx_purchase_items_product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `suspended_sales` (
  `id` varchar(36) NOT NULL,
  `temp_number` varchar(60) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_id` varchar(120) DEFAULT NULL,
  `subtotal` int NOT NULL DEFAULT '0',
  `discount` int NOT NULL DEFAULT '0',
  `total` int NOT NULL DEFAULT '0',
  `payment_method` varchar(40) NOT NULL DEFAULT 'EFECTIVO',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_suspended_sales_created` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `suspended_sale_items` (
  `id` varchar(36) NOT NULL,
  `suspended_sale_id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `qty` int NOT NULL DEFAULT '0',
  `unit_price` int NOT NULL DEFAULT '0',
  `line_total` int NOT NULL DEFAULT '0',
  `stock` int DEFAULT NULL,
  `unit_cost` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_suspended_sale_items_sale` (`suspended_sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

FLUSH PRIVILEGES;