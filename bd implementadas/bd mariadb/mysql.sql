-- =========================================================
-- MariaDB DDL SOLO PARA DIAGRAMA
-- =========================================================

DROP DATABASE IF EXISTS mysqllocal;
CREATE DATABASE mysqllocal
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE mysqllocal;

-- =========================================================
-- USERS
-- =========================================================
CREATE TABLE users (
  id VARCHAR(36) NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(20) NOT NULL,
  created_at DATETIME NOT NULL,
  must_change_password TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE KEY uq_users_email (email)
) ENGINE=InnoDB;

-- =========================================================
-- PRODUCTS
-- =========================================================
CREATE TABLE products (
  id VARCHAR(36) NOT NULL,
  brand VARCHAR(255) NOT NULL,
  model VARCHAR(255) NOT NULL,
  cpu VARCHAR(255) NOT NULL,
  ram_gb INT NOT NULL,
  storage VARCHAR(255) NOT NULL,
  `condition` VARCHAR(255) NOT NULL,
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  stock INT NOT NULL,
  notes TEXT,
  active TINYINT NOT NULL DEFAULT 1,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL,
  name VARCHAR(255) DEFAULT NULL,
  category VARCHAR(120) DEFAULT NULL,
  sku VARCHAR(64) DEFAULT NULL,
  barcode VARCHAR(64) DEFAULT NULL,
  unit VARCHAR(20) NOT NULL DEFAULT 'UND',
  min_stock INT NOT NULL DEFAULT 0,
  status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
  location VARCHAR(120) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_products_barcode (barcode),
  KEY idx_products_sku (sku)
) ENGINE=InnoDB;

-- =========================================================
-- SUPPLIERS
-- =========================================================
CREATE TABLE suppliers (
  id VARCHAR(36) NOT NULL,
  name VARCHAR(255) NOT NULL,
  contact_name VARCHAR(255) DEFAULT NULL,
  phone VARCHAR(80) DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL,
  address TEXT,
  notes TEXT,
  active TINYINT NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  KEY idx_suppliers_name (name)
) ENGINE=InnoDB;

-- =========================================================
-- SALES
-- =========================================================
CREATE TABLE sales (
  id VARCHAR(36) NOT NULL,
  invoice_number VARCHAR(50) NOT NULL,
  date DATETIME NOT NULL,
  user_id VARCHAR(36) NOT NULL,
  payment_method VARCHAR(50) NOT NULL,
  subtotal INT NOT NULL,
  discount INT NOT NULL,
  total INT NOT NULL,
  customer_name VARCHAR(255) DEFAULT NULL,
  customer_id VARCHAR(255) DEFAULT NULL,
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uq_sales_invoice_number (invoice_number),
  KEY idx_sales_user_id (user_id),
  CONSTRAINT fk_sales_user
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- SALE ITEMS
-- =========================================================
CREATE TABLE sale_items (
  id VARCHAR(36) NOT NULL,
  sale_id VARCHAR(36) NOT NULL,
  product_id VARCHAR(36) DEFAULT NULL,
  qty INT NOT NULL,
  unit_price INT NOT NULL,
  line_total INT NOT NULL,
  description TEXT,
  unit_cost DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (id),
  KEY idx_sale_items_sale_id (sale_id),
  KEY idx_sale_items_product_id (product_id),
  CONSTRAINT fk_sale_items_sale
    FOREIGN KEY (sale_id) REFERENCES sales(id),
  CONSTRAINT fk_sale_items_product
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

-- =========================================================
-- SALE RETURNS
-- =========================================================
CREATE TABLE sale_returns (
  id VARCHAR(36) NOT NULL,
  sale_id VARCHAR(36) NOT NULL,
  user_id VARCHAR(36) NOT NULL,
  reason TEXT,
  total_returned INT NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  KEY idx_sale_returns_sale_id (sale_id),
  KEY idx_sale_returns_user_id (user_id),
  KEY idx_sale_returns_created_at (created_at),
  CONSTRAINT fk_sale_returns_sale
    FOREIGN KEY (sale_id) REFERENCES sales(id),
  CONSTRAINT fk_sale_returns_user
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- SALE RETURN ITEMS
-- =========================================================
CREATE TABLE sale_return_items (
  id VARCHAR(36) NOT NULL,
  return_id VARCHAR(36) NOT NULL,
  sale_item_id VARCHAR(36) NOT NULL,
  product_id VARCHAR(36) DEFAULT NULL,
  qty INT NOT NULL,
  unit_price INT NOT NULL,
  line_total INT NOT NULL,
  description TEXT,
  PRIMARY KEY (id),
  KEY idx_sale_return_items_return_id (return_id),
  KEY idx_sale_return_items_sale_item_id (sale_item_id),
  KEY idx_sale_return_items_product_id (product_id),
  CONSTRAINT fk_sale_return_items_return
    FOREIGN KEY (return_id) REFERENCES sale_returns(id),
  CONSTRAINT fk_sale_return_items_sale_item
    FOREIGN KEY (sale_item_id) REFERENCES sale_items(id),
  CONSTRAINT fk_sale_return_items_product
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

-- =========================================================
-- CASH SESSIONS
-- =========================================================
CREATE TABLE cash_sessions (
  id VARCHAR(36) NOT NULL,
  user_id VARCHAR(36) NOT NULL,
  opened_at DATETIME NOT NULL,
  closed_at DATETIME DEFAULT NULL,
  opening_cash INT NOT NULL DEFAULT 0,
  expected_cash INT NOT NULL DEFAULT 0,
  counted_cash INT DEFAULT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idx_cash_sessions_opened (opened_at),
  KEY idx_cash_sessions_user (user_id),
  CONSTRAINT fk_cash_sessions_user
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- CASH MOVEMENTS
-- =========================================================
CREATE TABLE cash_movements (
  id VARCHAR(36) NOT NULL,
  session_id VARCHAR(36) NOT NULL,
  type VARCHAR(32) NOT NULL,
  amount INT NOT NULL DEFAULT 0,
  note VARCHAR(255) DEFAULT NULL,
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  KEY idx_cash_movements_session (session_id),
  KEY idx_cash_movements_created (created_at),
  CONSTRAINT fk_cash_movements_session
    FOREIGN KEY (session_id) REFERENCES cash_sessions(id)
    ON DELETE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- CASH CLOSURES
-- =========================================================
CREATE TABLE cash_closures (
  id VARCHAR(36) NOT NULL,
  opened_at DATETIME DEFAULT NULL,
  opened_by VARCHAR(36) DEFAULT NULL,
  opening_cash DECIMAL(12,2) DEFAULT NULL,
  opening_notes TEXT,
  closed_at DATETIME DEFAULT NULL,
  closed_by VARCHAR(36) DEFAULT NULL,
  counted_cash DECIMAL(12,2) DEFAULT NULL,
  expected_cash DECIMAL(12,2) DEFAULT NULL,
  total_sales DECIMAL(12,2) DEFAULT NULL,
  total_expenses DECIMAL(12,2) DEFAULT NULL,
  difference DECIMAL(12,2) DEFAULT NULL,
  notes TEXT,
  PRIMARY KEY (id),
  KEY idx_cash_closures_opened_by (opened_by),
  KEY idx_cash_closures_closed_by (closed_by),
  CONSTRAINT fk_cash_closures_opened_by
    FOREIGN KEY (opened_by) REFERENCES users(id),
  CONSTRAINT fk_cash_closures_closed_by
    FOREIGN KEY (closed_by) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- EXPENSES
-- =========================================================
CREATE TABLE expenses (
  id VARCHAR(36) NOT NULL,
  date DATETIME DEFAULT NULL,
  concept VARCHAR(200) DEFAULT NULL,
  amount DECIMAL(12,2) DEFAULT NULL,
  notes TEXT,
  created_at DATETIME DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- =========================================================
-- INVOICE COUNTERS
-- =========================================================
CREATE TABLE invoice_counters (
  `year` INT NOT NULL,
  last_number INT NOT NULL DEFAULT 0,
  seq INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB;

-- =========================================================
-- PURCHASES
-- =========================================================
CREATE TABLE purchases (
  id VARCHAR(36) NOT NULL,
  supplier_id VARCHAR(36) DEFAULT NULL,
  user_id VARCHAR(36) NOT NULL,
  invoice_ref VARCHAR(120) DEFAULT NULL,
  date DATETIME NOT NULL,
  subtotal INT NOT NULL DEFAULT 0,
  total INT NOT NULL DEFAULT 0,
  notes TEXT,
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  KEY idx_purchases_date (date),
  KEY idx_purchases_supplier_id (supplier_id),
  KEY idx_purchases_user_id (user_id),
  CONSTRAINT fk_purchases_supplier
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
  CONSTRAINT fk_purchases_user
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- PURCHASE ITEMS
-- =========================================================
CREATE TABLE purchase_items (
  id VARCHAR(36) NOT NULL,
  purchase_id VARCHAR(36) NOT NULL,
  product_id VARCHAR(36) NOT NULL,
  qty INT NOT NULL,
  unit_cost INT NOT NULL,
  line_total INT NOT NULL,
  PRIMARY KEY (id),
  KEY idx_purchase_items_purchase_id (purchase_id),
  KEY idx_purchase_items_product_id (product_id),
  CONSTRAINT fk_purchase_items_purchase
    FOREIGN KEY (purchase_id) REFERENCES purchases(id),
  CONSTRAINT fk_purchase_items_product
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

-- =========================================================
-- AUDIT LOGS
-- =========================================================
CREATE TABLE audit_logs (
  id VARCHAR(36) NOT NULL,
  actor_user_id VARCHAR(36) NOT NULL,
  action VARCHAR(50) NOT NULL,
  entity_type VARCHAR(50) NOT NULL,
  entity_id VARCHAR(36) DEFAULT NULL,
  metadata TEXT,
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  KEY idx_audit_logs_actor_user_id (actor_user_id),
  CONSTRAINT fk_audit_logs_user
    FOREIGN KEY (actor_user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- SUSPENDED SALES
-- =========================================================
CREATE TABLE suspended_sales (
  id VARCHAR(36) NOT NULL,
  temp_number VARCHAR(60) NOT NULL,
  user_id VARCHAR(36) DEFAULT NULL,
  customer_name VARCHAR(255) DEFAULT NULL,
  customer_id VARCHAR(120) DEFAULT NULL,
  subtotal INT NOT NULL DEFAULT 0,
  discount INT NOT NULL DEFAULT 0,
  total INT NOT NULL DEFAULT 0,
  payment_method VARCHAR(40) NOT NULL DEFAULT 'EFECTIVO',
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  KEY idx_suspended_sales_created (created_at),
  KEY idx_suspended_sales_user_id (user_id),
  CONSTRAINT fk_suspended_sales_user
    FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- SUSPENDED SALE ITEMS
-- =========================================================
CREATE TABLE suspended_sale_items (
  id VARCHAR(36) NOT NULL,
  suspended_sale_id VARCHAR(36) NOT NULL,
  product_id VARCHAR(36) DEFAULT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  qty INT NOT NULL DEFAULT 0,
  unit_price INT NOT NULL DEFAULT 0,
  line_total INT NOT NULL DEFAULT 0,
  stock INT DEFAULT NULL,
  unit_cost DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  KEY idx_suspended_sale_items_sale (suspended_sale_id),
  KEY idx_suspended_sale_items_product (product_id),
  CONSTRAINT fk_suspended_sale_items_sale
    FOREIGN KEY (suspended_sale_id) REFERENCES suspended_sales(id),
  CONSTRAINT fk_suspended_sale_items_product
    FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

-- =========================================================
-- ELECTRONIC BILLING SETTINGS
-- =========================================================
CREATE TABLE electronic_billing_settings (
  id VARCHAR(36) NOT NULL,
  enabled TINYINT(1) NOT NULL DEFAULT 0,
  provider VARCHAR(30) NOT NULL DEFAULT 'factus',
  environment VARCHAR(20) NOT NULL DEFAULT 'sandbox',
  base_url VARCHAR(255) NOT NULL,
  username VARCHAR(255) DEFAULT NULL,
  password VARCHAR(255) DEFAULT NULL,
  client_id VARCHAR(255) DEFAULT NULL,
  client_secret VARCHAR(255) DEFAULT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- =========================================================
-- ELECTRONIC INVOICE EVENTS
-- =========================================================
CREATE TABLE electronic_invoice_events (
  id VARCHAR(36) NOT NULL,
  sale_id VARCHAR(36) NOT NULL,
  related_sale_id VARCHAR(36) DEFAULT NULL,
  event_type VARCHAR(20) NOT NULL,
  provider VARCHAR(30) NOT NULL DEFAULT 'factus',
  status VARCHAR(30) DEFAULT NULL,
  provider_document_id BIGINT DEFAULT NULL,
  provider_number VARCHAR(120) DEFAULT NULL,
  provider_public_url TEXT,
  cufe VARCHAR(255) DEFAULT NULL,
  related_provider_document_id BIGINT DEFAULT NULL,
  related_provider_number VARCHAR(120) DEFAULT NULL,
  reason_code VARCHAR(20) DEFAULT NULL,
  reason_text TEXT,
  amount INT DEFAULT NULL,
  payload_json LONGTEXT,
  response_json LONGTEXT,
  error_text TEXT,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  KEY idx_eie_sale_id (sale_id),
  KEY idx_eie_related_sale_id (related_sale_id),
  KEY idx_eie_event_type (event_type),
  KEY idx_eie_created_at (created_at),
  CONSTRAINT fk_eie_sale
    FOREIGN KEY (sale_id) REFERENCES sales(id),
  CONSTRAINT fk_eie_related_sale
    FOREIGN KEY (related_sale_id) REFERENCES sales(id)
) ENGINE=InnoDB;