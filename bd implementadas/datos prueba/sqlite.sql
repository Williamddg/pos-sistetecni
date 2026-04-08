-- =========================================================
-- 1. USERS
-- =========================================================
INSERT INTO users (id, name, email, password_hash, role, created_at, must_change_password) VALUES
('u001-0001-0001-0001-000000000001', 'Admin Principal', 'admin@tienda.com', '$2y$10$hash1', 'ADMIN', NOW(), 0),
('u001-0001-0001-0001-000000000002', 'Cajero Juan', 'juan@tienda.com', '$2y$10$hash2', 'CASHIER', NOW(), 1),
('u001-0001-0001-0001-000000000003', 'Vendedor Ana', 'ana@tienda.com', '$2y$10$hash3', 'SELLER', NOW(), 0);

-- =========================================================
-- 2. PRODUCTS
-- =========================================================
INSERT INTO products (id, brand, model, cpu, ram_gb, storage, `condition`, purchase_price, sale_price, stock, notes, active, created_at, updated_at, name, category, sku, barcode, unit, min_stock, status, location) VALUES
('p001-0001-0001-0001-000000000001', 'Dell', 'Latitude 3420', 'Intel i5-1135G7', 8, '256GB SSD', 'Nuevo', 500000, 750000, 10, 'Laptop oficina', 1, NOW(), NOW(), 'Laptop Dell Latitude', 'Laptops', 'DELL-3420', '1234567890123', 'UND', 2, 'ACTIVE', 'Estante A1'),
('p001-0001-0001-0001-000000000002', 'HP', 'Pavilion 15', 'Ryzen 5 5500U', 16, '512GB SSD', 'Nuevo', 650000, 890000, 5, 'Gama media', 1, NOW(), NOW(), 'HP Pavilion', 'Laptops', 'HP-PAV15', '2345678901234', 'UND', 1, 'ACTIVE', 'Estante A2'),
('p001-0001-0001-0001-000000000003', 'Logitech', 'MX Master 3', NULL, NULL, NULL, 'Nuevo', 80000, 120000, 20, 'Mouse inalámbrico', 1, NOW(), NOW(), 'Mouse Logitech', 'Accesorios', 'LOG-MX3', '3456789012345', 'UND', 5, 'ACTIVE', 'Gabinete B');

-- =========================================================
-- 3. SUPPLIERS
-- =========================================================
INSERT INTO suppliers (id, name, contact_name, phone, email, address, notes, active, created_at, updated_at) VALUES
('s001-0001-0001-0001-000000000001', 'Importadora Tech S.A.', 'Carlos López', '3001234567', 'ventas@importtech.com', 'Calle 10 #20-30, Bogotá', 'Proveedor principal', 1, NOW(), NOW()),
('s001-0001-0001-0001-000000000002', 'Distribuidora de PCs', 'María Gómez', '3109876543', 'maria@distripc.com', 'Cra 5 #12-45, Medellín', 'Descuentos por volumen', 1, NOW(), NOW()),
('s001-0001-0001-0001-000000000003', 'Accesorios Digitales', 'Pedro Ruiz', '3204567890', 'pedro@accesorios.com', 'Calle 50 #8-12, Cali', 'Entrega rápida', 1, NOW(), NOW());

-- =========================================================
-- 4. SALES (requiere user_id)
-- =========================================================
INSERT INTO sales (id, invoice_number, date, user_id, payment_method, subtotal, discount, total, customer_name, customer_id, created_at) VALUES
('sal-0001-0001-0001-000000000001', 'INV-001', NOW(), 'u001-0001-0001-0001-000000000002', 'EFECTIVO', 870000, 0, 870000, 'Cliente Anónimo', NULL, NOW()),
('sal-0001-0001-0001-000000000002', 'INV-002', NOW() - INTERVAL 1 DAY, 'u001-0001-0001-0001-000000000003', 'TARJETA', 120000, 10000, 110000, 'Carlos Pérez', 'CC-123456', NOW() - INTERVAL 1 DAY),
('sal-0001-0001-0001-000000000003', 'INV-003', NOW() - INTERVAL 2 DAY, 'u001-0001-0001-0001-000000000002', 'TRANSFERENCIA', 890000, 50000, 840000, 'Luisa Fernández', 'NIT-987654', NOW() - INTERVAL 2 DAY);

-- =========================================================
-- 5. SALE ITEMS
-- =========================================================
INSERT INTO sale_items (id, sale_id, product_id, qty, unit_price, line_total, description, unit_cost) VALUES
('si-0001-0001-0001-000000000001', 'sal-0001-0001-0001-000000000001', 'p001-0001-0001-0001-000000000001', 1, 750000, 750000, 'Laptop Dell', 500000),
('si-0001-0001-0001-000000000002', 'sal-0001-0001-0001-000000000001', 'p001-0001-0001-0001-000000000003', 1, 120000, 120000, 'Mouse Logitech', 80000),
('si-0001-0001-0001-000000000003', 'sal-0001-0001-0001-000000000002', 'p001-0001-0001-0001-000000000003', 1, 120000, 120000, 'Mouse', 80000),
('si-0001-0001-0001-000000000004', 'sal-0001-0001-0001-000000000003', 'p001-0001-0001-0001-000000000002', 1, 890000, 890000, 'HP Pavilion', 650000);

-- =========================================================
-- 6. SALE RETURNS
-- =========================================================
INSERT INTO sale_returns (id, sale_id, user_id, reason, total_returned, created_at) VALUES
('sr-0001-0001-0001-000000000001', 'sal-0001-0001-0001-000000000002', 'u001-0001-0001-0001-000000000001', 'Producto defectuoso', 120000, NOW()),
('sr-0001-0001-0001-000000000002', 'sal-0001-0001-0001-000000000003', 'u001-0001-0001-0001-000000000003', 'Cambio de opinión', 890000, NOW() - INTERVAL 1 DAY);

-- =========================================================
-- 7. SALE RETURN ITEMS
-- =========================================================
INSERT INTO sale_return_items (id, return_id, sale_item_id, product_id, qty, unit_price, line_total, description) VALUES
('sri-0001-0001-0001-000000000001', 'sr-0001-0001-0001-000000000001', 'si-0001-0001-0001-000000000003', 'p001-0001-0001-0001-000000000003', 1, 120000, 120000, 'Mouse no funciona'),
('sri-0001-0001-0001-000000000002', 'sr-0001-0001-0001-000000000002', 'si-0001-0001-0001-000000000004', 'p001-0001-0001-0001-000000000002', 1, 890000, 890000, 'Cliente no conforme');

-- =========================================================
-- 8. CASH SESSIONS
-- =========================================================
INSERT INTO cash_sessions (id, user_id, opened_at, closed_at, opening_cash, expected_cash, counted_cash, created_at, updated_at) VALUES
('cs-0001-0001-0001-000000000001', 'u001-0001-0001-0001-000000000002', NOW() - INTERVAL 8 HOUR, NULL, 500000, 1370000, NULL, NOW() - INTERVAL 8 HOUR, NULL),
('cs-0001-0001-0001-000000000002', 'u001-0001-0001-0001-000000000003', NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY + INTERVAL 8 HOUR, 300000, 400000, 395000, NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY + INTERVAL 8 HOUR),
('cs-0001-0001-0001-000000000003', 'u001-0001-0001-0001-000000000002', NOW() - INTERVAL 2 DAY, NOW() - INTERVAL 2 DAY + INTERVAL 9 HOUR, 200000, 1040000, 1045000, NOW() - INTERVAL 2 DAY, NOW() - INTERVAL 2 DAY + INTERVAL 9 HOUR);

-- =========================================================
-- 9. CASH MOVEMENTS
-- =========================================================
INSERT INTO cash_movements (id, session_id, type, amount, note, created_at) VALUES
('cm-0001-0001-0001-000000000001', 'cs-0001-0001-0001-000000000001', 'SALE', 870000, 'Venta INV-001', NOW()),
('cm-0001-0001-0001-000000000002', 'cs-0001-0001-0001-000000000001', 'EXPENSE', 50000, 'Compra de café', NOW() - INTERVAL 2 HOUR),
('cm-0001-0001-0001-000000000003', 'cs-0001-0001-0001-000000000002', 'SALE', 110000, 'Venta INV-002', NOW() - INTERVAL 1 DAY + INTERVAL 2 HOUR);

-- =========================================================
-- 10. CASH CLOSURES
-- =========================================================
INSERT INTO cash_closures (id, opened_at, opened_by, opening_cash, opening_notes, closed_at, closed_by, counted_cash, expected_cash, total_sales, total_expenses, difference, notes) VALUES
('cc-0001-0001-0001-000000000001', '2025-03-01 08:00:00', 'u001-0001-0001-0001-000000000001', 500000, 'Caja inicial', '2025-03-01 18:00:00', 'u001-0001-0001-0001-000000000001', 1500000, 1520000, 1200000, 20000, -20000, 'Faltante menor'),
('cc-0001-0001-0001-000000000002', '2025-03-02 08:30:00', 'u001-0001-0001-0001-000000000002', 300000, NULL, '2025-03-02 17:30:00', 'u001-0001-0001-0001-000000000002', 950000, 940000, 700000, 60000, 10000, 'Sobrante por redondeo'),
('cc-0001-0001-0001-000000000003', '2025-03-03 09:00:00', 'u001-0001-0001-0001-000000000003', 400000, 'Con monedas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Abierta aún');

-- =========================================================
-- 11. EXPENSES
-- =========================================================
INSERT INTO expenses (id, date, concept, amount, notes, created_at) VALUES
('exp-0001-0001-0001-000000000001', '2025-03-20', 'Pago de luz', 150000, 'Factura marzo', NOW()),
('exp-0001-0001-0001-000000000002', '2025-03-21', 'Mantenimiento equipos', 80000, 'Limpieza laptops', NOW()),
('exp-0001-0001-0001-000000000003', '2025-03-22', 'Internet', 120000, 'Plan empresarial', NOW());

-- =========================================================
-- 12. PURCHASES
-- =========================================================
INSERT INTO purchases (id, supplier_id, user_id, invoice_ref, date, subtotal, total, notes, created_at) VALUES
('pur-0001-0001-0001-000000000001', 's001-0001-0001-0001-000000000001', 'u001-0001-0001-0001-000000000001', 'FAC-001', '2025-03-10', 1150000, 1150000, 'Compra inicial', NOW()),
('pur-0001-0001-0001-000000000002', 's001-0001-0001-0001-000000000002', 'u001-0001-0001-0001-000000000002', 'FAC-002', '2025-03-15', 80000, 80000, 'Mouse Logitech', NOW()),
('pur-0001-0001-0001-000000000003', 's001-0001-0001-0001-000000000003', 'u001-0001-0001-0001-000000000003', 'FAC-003', '2025-03-18', 650000, 650000, 'HP Pavilion', NOW());

-- =========================================================
-- 13. PURCHASE ITEMS
-- =========================================================
INSERT INTO purchase_items (id, purchase_id, product_id, qty, unit_cost, line_total) VALUES
('pi-0001-0001-0001-000000000001', 'pur-0001-0001-0001-000000000001', 'p001-0001-0001-0001-000000000001', 2, 500000, 1000000),
('pi-0001-0001-0001-000000000002', 'pur-0001-0001-0001-000000000001', 'p001-0001-0001-0001-000000000003', 3, 80000, 240000),
('pi-0001-0001-0001-000000000003', 'pur-0001-0001-0001-000000000002', 'p001-0001-0001-0001-000000000003', 1, 80000, 80000),
('pi-0001-0001-0001-000000000004', 'pur-0001-0001-0001-000000000003', 'p001-0001-0001-0001-000000000002', 1, 650000, 650000);

-- =========================================================
-- 14. AUDIT LOGS
-- =========================================================
INSERT INTO audit_logs (id, actor_user_id, action, entity_type, entity_id, metadata, created_at) VALUES
('aud-0001-0001-0001-000000000001', 'u001-0001-0001-0001-000000000001', 'CREATE', 'PRODUCT', 'p001-0001-0001-0001-000000000001', '{"price":750000}', NOW()),
('aud-0001-0001-0001-000000000002', 'u001-0001-0001-0001-000000000002', 'SALE', 'SALE', 'sal-0001-0001-0001-000000000001', '{"total":870000}', NOW() - INTERVAL 1 HOUR),
('aud-0001-0001-0001-000000000003', 'u001-0001-0001-0001-000000000003', 'UPDATE', 'PRODUCT', 'p001-0001-0001-0001-000000000003', '{"stock":20}', NOW() - INTERVAL 2 HOUR);

-- =========================================================
-- 15. SUSPENDED SALES
-- =========================================================
INSERT INTO suspended_sales (id, temp_number, user_id, customer_name, customer_id, subtotal, discount, total, payment_method, created_at, updated_at) VALUES
('ss-0001-0001-0001-000000000001', 'TEMP-001', 'u001-0001-0001-0001-000000000002', 'Pedro Martínez', 'CC-111222', 750000, 0, 750000, 'EFECTIVO', NOW() - INTERVAL 1 DAY, NOW() - INTERVAL 1 DAY),
('ss-0001-0001-0001-000000000002', 'TEMP-002', 'u001-0001-0001-0001-000000000003', NULL, NULL, 240000, 20000, 220000, 'TARJETA', NOW(), NOW()),
('ss-0001-0001-0001-000000000003', 'TEMP-003', 'u001-0001-0001-0001-000000000001', 'Laura Gómez', 'CC-333444', 120000, 0, 120000, 'EFECTIVO', NOW() - INTERVAL 2 DAY, NOW() - INTERVAL 2 DAY);

-- =========================================================
-- 16. SUSPENDED SALE ITEMS
-- =========================================================
INSERT INTO suspended_sale_items (id, suspended_sale_id, product_id, name, description, qty, unit_price, line_total, stock, unit_cost) VALUES
('ssi-0001-0001-0001-000000000001', 'ss-0001-0001-0001-000000000001', 'p001-0001-0001-0001-000000000001', 'Laptop Dell Latitude', 'i5, 8GB, 256GB', 1, 750000, 750000, 10, 500000),
('ssi-0001-0001-0001-000000000002', 'ss-0001-0001-0001-000000000002', 'p001-0001-0001-0001-000000000003', 'Mouse Logitech', 'MX Master 3', 2, 120000, 240000, 20, 80000),
('ssi-0001-0001-0001-000000000003', 'ss-0001-0001-0001-000000000003', 'p001-0001-0001-0001-000000000003', 'Mouse Logitech', 'Inalámbrico', 1, 120000, 120000, 20, 80000);