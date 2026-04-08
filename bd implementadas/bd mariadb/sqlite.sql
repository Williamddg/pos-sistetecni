-- =========================================================
-- DB SOLO PARA DIAGRAMA (DBeaver)
-- =========================================================

DROP DATABASE IF EXISTS sqlite;
CREATE DATABASE sqlite CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sqlite;

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
  UNIQUE KEY email (email)
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
  name VARCHAR(255),
  category VARCHAR(120),
  sku VARCHAR(64),
  barcode VARCHAR(64),
  unit VARCHAR(20) NOT NULL DEFAULT 'UND',
  min_stock INT NOT NULL DEFAULT 0,
  status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
  location VARCHAR(120),
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- =========================================================
-- SUPPLIERS
-- =========================================================
CREATE TABLE suppliers (
  id VARCHAR(36) NOT NULL,
  name VARCHAR(255) NOT NULL,
  contact_name VARCHAR(255),
  phone VARCHAR(80),
  email VARCHAR(255),
  address TEXT,
  notes TEXT,
  active TINYINT NOT NULL DEFAULT 1,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id)
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
  customer_name VARCHAR(255),
  customer_id VARCHAR(255),
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY invoice_number (invoice_number),
  CONSTRAINT fk_sales_user FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- SALE ITEMS
-- =========================================================
CREATE TABLE sale_items (
  id VARCHAR(36) NOT NULL,
  sale_id VARCHAR(36) NOT NULL,
  product_id VARCHAR(36),
  qty INT NOT NULL,
  unit_price INT NOT NULL,
  line_total INT NOT NULL,
  description TEXT,
  unit_cost DECIMAL(10,2) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  CONSTRAINT fk_sale_items_sale FOREIGN KEY (sale_id) REFERENCES sales(id),
  CONSTRAINT fk_sale_items_product FOREIGN KEY (product_id) REFERENCES products(id)
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
  CONSTRAINT fk_sale_returns_sale FOREIGN KEY (sale_id) REFERENCES sales(id),
  CONSTRAINT fk_sale_returns_user FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- SALE RETURN ITEMS
-- =========================================================
CREATE TABLE sale_return_items (
  id VARCHAR(36) NOT NULL,
  return_id VARCHAR(36) NOT NULL,
  sale_item_id VARCHAR(36) NOT NULL,
  product_id VARCHAR(36),
  qty INT NOT NULL,
  unit_price INT NOT NULL,
  line_total INT NOT NULL,
  description TEXT,
  PRIMARY KEY (id),
  CONSTRAINT fk_return_items_return FOREIGN KEY (return_id) REFERENCES sale_returns(id),
  CONSTRAINT fk_return_items_sale_item FOREIGN KEY (sale_item_id) REFERENCES sale_items(id),
  CONSTRAINT fk_return_items_product FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

-- =========================================================
-- CASH SESSIONS
-- =========================================================
CREATE TABLE cash_sessions (
  id VARCHAR(36) NOT NULL,
  user_id VARCHAR(36) NOT NULL,
  opened_at DATETIME NOT NULL,
  closed_at DATETIME,
  opening_cash INT NOT NULL DEFAULT 0,
  expected_cash INT NOT NULL DEFAULT 0,
  counted_cash INT,
  created_at DATETIME NOT NULL,
  updated_at DATETIME,
  PRIMARY KEY (id),
  CONSTRAINT fk_cash_sessions_user FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- CASH MOVEMENTS
-- =========================================================
CREATE TABLE cash_movements (
  id VARCHAR(36) NOT NULL,
  session_id VARCHAR(36) NOT NULL,
  type VARCHAR(32) NOT NULL,
  amount INT NOT NULL DEFAULT 0,
  note VARCHAR(255),
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_cash_movements_session FOREIGN KEY (session_id) REFERENCES cash_sessions(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- CASH CLOSURES
-- =========================================================
CREATE TABLE cash_closures (
  id VARCHAR(36) NOT NULL,
  opened_at DATETIME,
  opened_by VARCHAR(36),
  opening_cash DECIMAL(12,2),
  opening_notes TEXT,
  closed_at DATETIME,
  closed_by VARCHAR(36),
  counted_cash DECIMAL(12,2),
  expected_cash DECIMAL(12,2),
  total_sales DECIMAL(12,2),
  total_expenses DECIMAL(12,2),
  difference DECIMAL(12,2),
  notes TEXT,
  PRIMARY KEY (id),
  CONSTRAINT fk_cash_closures_opened_by FOREIGN KEY (opened_by) REFERENCES users(id),
  CONSTRAINT fk_cash_closures_closed_by FOREIGN KEY (closed_by) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- EXPENSES
-- =========================================================
CREATE TABLE expenses (
  id VARCHAR(36) NOT NULL,
  date DATETIME,
  concept VARCHAR(200),
  amount DECIMAL(12,2),
  notes TEXT,
  created_at DATETIME,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

-- =========================================================
-- PURCHASES
-- =========================================================
CREATE TABLE purchases (
  id VARCHAR(36) NOT NULL,
  supplier_id VARCHAR(36),
  user_id VARCHAR(36) NOT NULL,
  invoice_ref VARCHAR(120),
  date DATETIME NOT NULL,
  subtotal INT NOT NULL DEFAULT 0,
  total INT NOT NULL DEFAULT 0,
  notes TEXT,
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_purchases_supplier FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
  CONSTRAINT fk_purchases_user FOREIGN KEY (user_id) REFERENCES users(id)
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
  CONSTRAINT fk_purchase_items_purchase FOREIGN KEY (purchase_id) REFERENCES purchases(id),
  CONSTRAINT fk_purchase_items_product FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;

-- =========================================================
-- AUDIT LOGS
-- =========================================================
CREATE TABLE audit_logs (
  id VARCHAR(36) NOT NULL,
  actor_user_id VARCHAR(36) NOT NULL,
  action VARCHAR(50) NOT NULL,
  entity_type VARCHAR(50) NOT NULL,
  entity_id VARCHAR(36),
  metadata TEXT,
  created_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_audit_logs_user FOREIGN KEY (actor_user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- SUSPENDED SALES
-- =========================================================
CREATE TABLE suspended_sales (
  id VARCHAR(36) NOT NULL,
  temp_number VARCHAR(60) NOT NULL,
  user_id VARCHAR(36),
  customer_name VARCHAR(255),
  customer_id VARCHAR(120),
  subtotal INT NOT NULL DEFAULT 0,
  discount INT NOT NULL DEFAULT 0,
  total INT NOT NULL DEFAULT 0,
  payment_method VARCHAR(40) NOT NULL DEFAULT 'EFECTIVO',
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_suspended_sales_user FOREIGN KEY (user_id) REFERENCES users(id)
) ENGINE=InnoDB;

-- =========================================================
-- SUSPENDED SALE ITEMS
-- =========================================================
CREATE TABLE suspended_sale_items (
  id VARCHAR(36) NOT NULL,
  suspended_sale_id VARCHAR(36) NOT NULL,
  product_id VARCHAR(36),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  qty INT NOT NULL DEFAULT 0,
  unit_price INT NOT NULL DEFAULT 0,
  line_total INT NOT NULL DEFAULT 0,
  stock INT,
  unit_cost DOUBLE NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  CONSTRAINT fk_suspended_items_sale FOREIGN KEY (suspended_sale_id) REFERENCES suspended_sales(id),
  CONSTRAINT fk_suspended_items_product FOREIGN KEY (product_id) REFERENCES products(id)
) ENGINE=InnoDB;