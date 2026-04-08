-- =========================================================
-- SECCIÓN 1: DATOS DE PRUEBA (2-3 INSERTS POR TABLA)
-- =========================================================

-- USERS
INSERT INTO users (id, name, email, password_hash, role, created_at, must_change_password) VALUES
('usr_admin', 'Admin Principal', 'admin@test.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'ADMIN', NOW(), 0),
('usr_seller1', 'Ana Vendedor', 'ana@test.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', NOW(), 0),
('usr_seller2', 'Luis Vendedor', 'luis@test.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', NOW(), 1);

-- SUPPLIERS
INSERT INTO suppliers (id, name, contact_name, phone, email, address, notes, active, created_at, updated_at) VALUES
('sup_001', 'Tecnología Total S.A.', 'Carlos López', '555-1234', 'ventas@tecnologia.com', 'Av. Principal 123', 'Proveedor confiable', 1, NOW(), NOW()),
('sup_002', 'Distribuidora de Partes', 'Marta Ruiz', '555-5678', 'marta@partes.com', 'Calle 45 #12-34', NULL, 1, NOW(), NOW());

-- PRODUCTS
INSERT INTO products (id, brand, model, cpu, ram_gb, storage, `condition`, purchase_price, sale_price, stock, notes, active, created_at, updated_at, name, category, sku, barcode, unit, min_stock, status, location) VALUES
('prd_001', 'HP', 'Pavilion 15', 'Intel i5-1135G7', 8, '512GB SSD', 'Nuevo', 450000, 650000, 10, 'Laptop oficina', 1, NOW(), NOW(), 'Laptop HP Pavilion 15', 'Computadores', 'HP-PAV15', '1234567890123', 'UND', 2, 'ACTIVE', 'Estante A1'),
('prd_002', 'Logitech', 'M185', NULL, NULL, NULL, 'Nuevo', 15000, 25000, 50, 'Mouse inalámbrico', 1, NOW(), NOW(), 'Mouse Logitech M185', 'Accesorios', 'LOG-M185', '1234567890456', 'UND', 10, 'ACTIVE', 'Estante B2'),
('prd_003', 'Samsung', 'EVO 870', NULL, NULL, '1TB', 'Nuevo', 180000, 250000, 20, 'SSD 1TB', 1, NOW(), NOW(), 'Disco SSD Samsung 1TB', 'Almacenamiento', 'SAM-870-1T', '1234567890789', 'UND', 3, 'ACTIVE', 'Estante C3');

-- PURCHASES
INSERT INTO purchases (id, supplier_id, user_id, invoice_ref, date, subtotal, total, notes, created_at) VALUES
('pur_001', 'sup_001', 'usr_admin', 'INV-001', NOW(), 450000, 450000, 'Compra inicial laptops', NOW()),
('pur_002', 'sup_002', 'usr_admin', 'INV-002', NOW(), 750000, 750000, 'Compra mouses y SSDs', NOW());

-- PURCHASE ITEMS
INSERT INTO purchase_items (id, purchase_id, product_id, qty, unit_cost, line_total) VALUES
('puri_001', 'pur_001', 'prd_001', 1, 450000, 450000),
('puri_002', 'pur_002', 'prd_002', 30, 15000, 450000),
('puri_003', 'pur_002', 'prd_003', 2, 150000, 300000);

-- SALES
INSERT INTO sales (id, invoice_number, date, user_id, payment_method, subtotal, discount, total, customer_name, customer_id, created_at) VALUES
('sal_001', 'FAC-0001', NOW(), 'usr_seller1', 'EFECTIVO', 650000, 0, 650000, 'Cliente Uno', 'CC-12345', NOW()),
('sal_002', 'FAC-0002', NOW(), 'usr_seller2', 'TARJETA', 25000, 2500, 22500, 'Cliente Dos', 'CC-67890', NOW());

-- SALE ITEMS
INSERT INTO sale_items (id, sale_id, product_id, qty, unit_price, line_total, description, unit_cost) VALUES
('sali_001', 'sal_001', 'prd_001', 1, 650000, 650000, 'Laptop HP Pavilion 15', 450000),
('sali_002', 'sal_002', 'prd_002', 1, 25000, 25000, 'Mouse Logitech M185', 15000);

-- SALE RETURNS
INSERT INTO sale_returns (id, sale_id, user_id, reason, total_returned, created_at) VALUES
('ret_001', 'sal_002', 'usr_admin', 'Cliente devuelve mouse por defecto', 22500, NOW());

-- SALE RETURN ITEMS
INSERT INTO sale_return_items (id, return_id, sale_item_id, product_id, qty, unit_price, line_total, description) VALUES
('reti_001', 'ret_001', 'sali_002', 'prd_002', 1, 25000, 22500, 'Mouse defectuoso');

-- CASH SESSIONS
INSERT INTO cash_sessions (id, user_id, opened_at, closed_at, opening_cash, expected_cash, counted_cash, created_at, updated_at) VALUES
('cs_001', 'usr_seller1', NOW(), NULL, 500000, NULL, NULL, NOW(), NOW()),
('cs_002', 'usr_seller2', NOW(), NOW(), 200000, 250000, 245000, NOW(), NOW());

-- CASH MOVEMENTS
INSERT INTO cash_movements (id, session_id, type, amount, note, created_at) VALUES
('cm_001', 'cs_001', 'SALE', 650000, 'Venta FAC-0001', NOW()),
('cm_002', 'cs_001', 'EXPENSE', 5000, 'Compra de café', NOW());

-- CASH CLOSURES
INSERT INTO cash_closures (id, opened_at, opened_by, opening_cash, opening_notes, closed_at, closed_by, counted_cash, expected_cash, total_sales, total_expenses, difference, notes) VALUES
('cc_001', NOW(), 'usr_seller1', 500000, 'Caja inicial', NOW(), 'usr_seller1', 1150000, 1150000, 650000, 0, 0, 'Cierre correcto');

-- EXPENSES
INSERT INTO expenses (id, date, concept, amount, notes, created_at) VALUES
('exp_001', NOW(), 'Mantenimiento local', 30000, 'Limpieza y mantenimiento', NOW()),
('exp_002', NOW(), 'Papelería', 15000, 'Facturas y cintas', NOW());

-- INVOICE COUNTERS
INSERT INTO invoice_counters (`year`, last_number, seq) VALUES (YEAR(NOW()), 2, 2);

-- AUDIT LOGS
INSERT INTO audit_logs (id, actor_user_id, action, entity_type, entity_id, metadata, created_at) VALUES
('aud_001', 'usr_admin', 'CREATE', 'product', 'prd_001', '{"name":"Laptop HP"}', NOW()),
('aud_002', 'usr_admin', 'SALE', 'sale', 'sal_001', '{"total":650000}', NOW());

-- SUSPENDED SALES
INSERT INTO suspended_sales (id, temp_number, user_id, customer_name, customer_id, subtotal, discount, total, payment_method, created_at, updated_at) VALUES
('ss_001', 'TMP-001', 'usr_seller1', 'Cliente Temporal', 'CC-999', 275000, 0, 275000, 'EFECTIVO', NOW(), NOW());

-- SUSPENDED SALE ITEMS
INSERT INTO suspended_sale_items (id, suspended_sale_id, product_id, name, description, qty, unit_price, line_total, stock, unit_cost) VALUES
('ssi_001', 'ss_001', 'prd_003', 'Disco SSD Samsung 1TB', 'SSD 1TB', 1, 250000, 250000, 20, 180000),
('ssi_002', 'ss_001', 'prd_002', 'Mouse Logitech M185', 'Mouse inalámbrico', 1, 25000, 25000, 50, 15000);

-- ELECTRONIC BILLING SETTINGS
INSERT INTO electronic_billing_settings (id, enabled, provider, environment, base_url, username, password, client_id, client_secret, created_at, updated_at) VALUES
('ebs_001', 0, 'factus', 'sandbox', 'https://sandbox.factus.com', 'testuser', 'testpass', 'cli_test', 'sec_test', NOW(), NOW());

-- ELECTRONIC INVOICE EVENTS
INSERT INTO electronic_invoice_events (id, sale_id, related_sale_id, event_type, provider, status, provider_document_id, provider_number, provider_public_url, cufe, related_provider_document_id, related_provider_number, reason_code, reason_text, amount, payload_json, response_json, error_text, created_at, updated_at) VALUES
('eie_001', 'sal_001', NULL, 'SEND', 'factus', 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 650000, NULL, NULL, NULL, NOW(), NOW());