-- =========================================================
-- MariaDB DDL
-- Solo para modelado / diagrama en DBeaver
-- =========================================================

DROP DATABASE IF EXISTS supabase;
CREATE DATABASE supabase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE supabase;

-- =========================================================
-- Tabla: customers
-- =========================================================
CREATE TABLE customers (
    id CHAR(36) NOT NULL DEFAULT (UUID()),
    name VARCHAR(255) NULL,
    nit VARCHAR(100) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB;

-- =========================================================
-- Tabla: subscriptions
-- =========================================================
CREATE TABLE subscriptions (
    id CHAR(36) NOT NULL DEFAULT (UUID()),
    customer_id CHAR(36) NULL,
    plan VARCHAR(50) NULL,
    status VARCHAR(50) NULL,
    current_period_start DATE NULL,
    current_period_end DATE NULL,
    allowed_seats INT NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    KEY idx_subscriptions_customer_id (customer_id),
    CONSTRAINT fk_subscriptions_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- Tabla: licenses
-- =========================================================
CREATE TABLE licenses (
    license_key VARCHAR(255) NOT NULL,
    plan ENUM('MONTHLY', 'YEARLY', 'LIFETIME') NOT NULL,
    status ENUM('ACTIVE', 'BLOCKED', 'RELEASED', 'ARCHIVED') NOT NULL,
    current_period_end DATETIME NULL,
    max_machines INT NOT NULL DEFAULT 1,
    customer_name VARCHAR(255) NULL,
    customer_email VARCHAR(255) NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (license_key)
) ENGINE=InnoDB;

-- =========================================================
-- Tabla: license_keys
-- =========================================================
CREATE TABLE license_keys (
    id CHAR(36) NOT NULL DEFAULT (UUID()),
    subscription_id CHAR(36) NULL,
    `key` VARCHAR(255) NULL,
    max_activations INT NOT NULL DEFAULT 1,
    active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_license_keys_key (`key`),
    KEY idx_license_keys_subscription_id (subscription_id),
    CONSTRAINT fk_license_keys_subscription
        FOREIGN KEY (subscription_id)
        REFERENCES subscriptions(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- Tabla: activations
-- =========================================================
CREATE TABLE activations (
    id CHAR(36) NOT NULL DEFAULT (UUID()),
    license_key_id CHAR(36) NULL,
    machine_id VARCHAR(255) NULL,
    device_name VARCHAR(255) NULL,
    activated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_check_at DATETIME NULL,
    revoked_at DATETIME NULL,
    PRIMARY KEY (id),
    KEY idx_activations_license_key_id (license_key_id),
    CONSTRAINT fk_activations_license_key
        FOREIGN KEY (license_key_id)
        REFERENCES license_keys(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- =========================================================
-- Tabla: license_activations
-- =========================================================
CREATE TABLE license_activations (
    id CHAR(36) NOT NULL DEFAULT (UUID()),
    license_key VARCHAR(255) NOT NULL,
    machine_id VARCHAR(255) NOT NULL,
    first_seen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    last_seen DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    revoked BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id),
    KEY idx_license_activations_license_key (license_key),
    CONSTRAINT fk_license_activations_license
        FOREIGN KEY (license_key)
        REFERENCES licenses(license_key)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;