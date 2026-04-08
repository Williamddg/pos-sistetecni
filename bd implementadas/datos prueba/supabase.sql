-- =========================================================
-- 1. customers
-- =========================================================
INSERT INTO customers (id, name, nit) VALUES
(UUID(), 'TechSolutions S.A.S.', '901234567-1'),
(UUID(), 'Innovaciones López', '876543210-2'),
(UUID(), 'DataSoft Ltda.', '123456789-3');

-- =========================================================
-- 2. subscriptions
-- =========================================================
-- Obtener IDs reales de customers recién insertados (si no los conoces, consulta)
INSERT INTO subscriptions (id, customer_id, plan, status, current_period_start, current_period_end, allowed_seats)
SELECT UUID(), id, 'PRO', 'ACTIVE', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 YEAR), 5
FROM customers WHERE name = 'TechSolutions S.A.S.'
UNION ALL
SELECT UUID(), id, 'BASIC', 'TRIAL', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY), 2
FROM customers WHERE name = 'Innovaciones López'
UNION ALL
SELECT UUID(), id, 'ENTERPRISE', 'ACTIVE', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 6 MONTH), 20
FROM customers WHERE name = 'DataSoft Ltda.';

-- =========================================================
-- 3. licenses (tabla independiente, sin FK a customer)
-- =========================================================
INSERT INTO licenses (license_key, plan, status, current_period_end, max_machines, customer_name, customer_email) VALUES
('LIC-ABC123', 'YEARLY', 'ACTIVE', DATE_ADD(NOW(), INTERVAL 1 YEAR), 3, 'TechSolutions S.A.S.', 'contact@techsol.com'),
('LIC-DEF456', 'MONTHLY', 'ACTIVE', DATE_ADD(NOW(), INTERVAL 1 MONTH), 1, 'Innovaciones López', 'ventas@innolopez.com'),
('LIC-GHI789', 'LIFETIME', 'ACTIVE', NULL, 5, 'DataSoft Ltda.', 'admin@datasoft.com');

-- =========================================================
-- 4. license_keys (relacionada con subscriptions)
-- =========================================================
INSERT INTO license_keys (id, subscription_id, `key`, max_activations, active)
SELECT UUID(), s.id, CONCAT('KEY-', UPPER(SUBSTRING(MD5(RAND()), 1, 8))), s.allowed_seats, TRUE
FROM subscriptions s
WHERE s.customer_id IN (SELECT id FROM customers)
LIMIT 3;

-- =========================================================
-- 5. activations (relacionada con license_keys)
-- =========================================================
INSERT INTO activations (id, license_key_id, machine_id, device_name, last_check_at)
SELECT UUID(), lk.id, 'MAC-001', 'Workstation Principal', NOW()
FROM license_keys lk LIMIT 1
UNION ALL
SELECT UUID(), lk.id, 'MAC-002', 'Laptop Ventas', NOW()
FROM license_keys lk LIMIT 1 OFFSET 1
UNION ALL
SELECT UUID(), lk.id, 'MAC-003', 'Servidor DevOps', NOW()
FROM license_keys lk LIMIT 1 OFFSET 2;

-- =========================================================
-- 6. license_activations (relacionada con licenses)
-- =========================================================
INSERT INTO license_activations (id, license_key, machine_id, revoked) VALUES
(UUID(), 'LIC-ABC123', 'MACH-001', FALSE),
(UUID(), 'LIC-DEF456', 'MACH-002', FALSE),
(UUID(), 'LIC-GHI789', 'MACH-003', FALSE);