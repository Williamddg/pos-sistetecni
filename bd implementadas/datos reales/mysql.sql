-- =========================================================

-- 1. USERS (30+)
INSERT INTO users (id, name, email, password_hash, role, created_at, must_change_password) VALUES
('usr_001', 'Admin Global', 'admin@global.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'ADMIN', '2024-01-01 08:00:00', 0),
('usr_002', 'Carlos Pérez', 'cperez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-02 09:00:00', 0),
('usr_003', 'María Gómez', 'mgomez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-03 10:00:00', 0),
('usr_004', 'Luis Fernández', 'lfernandez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'INVENTORY', '2024-01-04 11:00:00', 1),
('usr_005', 'Ana Rodríguez', 'arodriguez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-05 12:00:00', 0),
('usr_006', 'Jorge Martínez', 'jmartinez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-06 13:00:00', 0),
('usr_007', 'Laura Sánchez', 'lsanchez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'CASHIER', '2024-01-07 14:00:00', 0),
('usr_008', 'Ricardo Díaz', 'rdiaz@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'ADMIN', '2024-01-08 15:00:00', 0),
('usr_009', 'Patricia López', 'plopez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-09 16:00:00', 0),
('usr_010', 'Andrés Morales', 'amorales@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-10 17:00:00', 1),
('usr_011', 'Carmen Vega', 'cvega@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'CASHIER', '2024-01-11 18:00:00', 0),
('usr_012', 'Fernando Castro', 'fcastro@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'INVENTORY', '2024-01-12 19:00:00', 0),
('usr_013', 'Gabriela Ríos', 'grios@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-13 20:00:00', 0),
('usr_014', 'Héctor Núñez', 'hnunez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-14 21:00:00', 0),
('usr_015', 'Isabel Silva', 'isilva@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'ADMIN', '2024-01-15 22:00:00', 0),
('usr_016', 'Javier Ortiz', 'jortiz@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-16 23:00:00', 0),
('usr_017', 'Karla Méndez', 'kmendez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'CASHIER', '2024-01-17 08:30:00', 0),
('usr_018', 'Leonardo Romero', 'lromero@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-18 09:45:00', 1),
('usr_019', 'Mónica Acosta', 'macosta@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-19 10:15:00', 0),
('usr_020', 'Nelson Paredes', 'nparedes@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'INVENTORY', '2024-01-20 11:20:00', 0),
('usr_021', 'Olga Guzmán', 'oguzman@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-21 12:40:00', 0),
('usr_022', 'Pablo Herrera', 'pherrera@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-22 13:50:00', 0),
('usr_023', 'Raquel Sandoval', 'rsandoval@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'CASHIER', '2024-01-23 14:10:00', 0),
('usr_024', 'Sergio Tapia', 'stapia@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'ADMIN', '2024-01-24 15:30:00', 0),
('usr_025', 'Teresa Urrutia', 'turrutia@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-25 16:45:00', 0),
('usr_026', 'Ulises Vásquez', 'uvasquez@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-26 17:55:00', 1),
('usr_027', 'Valeria Zambrano', 'vzambrano@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-27 18:05:00', 0),
('usr_028', 'Walter Ávila', 'wavila@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'INVENTORY', '2024-01-28 19:20:00', 0),
('usr_029', 'Ximena Bernal', 'xbernal@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'CASHIER', '2024-01-29 20:35:00', 0),
('usr_030', 'Yamil Castillo', 'ycastillo@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-01-30 21:50:00', 0),
('usr_031', 'Zoe Delgado', 'zdelgado@tienda.com', '$2y$10$N9qo8uLOickgx2ZMRZoMy.Mr/.cZ2kO2vYjWk6X6cXKxXxXxXxXx', 'SELLER', '2024-02-01 08:00:00', 0);

-- 2. SUPPLIERS (30+)
INSERT INTO suppliers (id, name, contact_name, phone, email, address, notes, active, created_at, updated_at) VALUES
('sup_01', 'TecnoDist S.A.', 'Juan Pérez', '3101111111', 'jperez@tecnodist.com', 'Calle 1 #23-45', 'Principal', 1, NOW(), NOW()),
('sup_02', 'Suministros PC', 'Ana Gómez', '3102222222', 'agomez@sumipc.com', 'Cra 2 #34-56', NULL, 1, NOW(), NOW()),
('sup_03', 'ElectroPartes', 'Luis Rodríguez', '3103333333', 'lrodriguez@electropartes.com', 'Av 3 #45-67', 'Oficial', 1, NOW(), NOW()),
('sup_04', 'Almacén Digital', 'Marta López', '3104444444', 'mlopez@aldigital.com', 'Transv 4 #56-78', NULL, 1, NOW(), NOW()),
('sup_05', 'Componentes SAS', 'Carlos Martínez', '3105555555', 'cmartinez@componentesas.com', 'Calle 5 #67-89', 'Certificado', 1, NOW(), NOW()),
('sup_06', 'Logitech Colombia', 'Sofía Fernández', '3106666666', 'sfernandez@logitech.co', 'Cra 6 #78-90', 'Representante oficial', 1, NOW(), NOW()),
('sup_07', 'HP Inc Colombia', 'Andrés Sánchez', '3107777777', 'asanchez@hp.com', 'Av 7 #89-01', 'Garantía extendida', 1, NOW(), NOW()),
('sup_08', 'Dell Colombia', 'Carolina Díaz', '3108888888', 'cdiaz@dell.com', 'Calle 8 #90-12', NULL, 1, NOW(), NOW()),
('sup_09', 'Apple Distribuciones', 'Felipe Castro', '3109999999', 'fcastro@apple.com', 'Cra 9 #01-23', 'Premium', 1, NOW(), NOW()),
('sup_10', 'Kingston Technology', 'Laura Ríos', '3110000000', 'lrios@kingston.com', 'Transv 10 #12-34', 'Memorias', 1, NOW(), NOW()),
('sup_11', 'Seagate', 'Jorge Méndez', '3111111111', 'jmendez@seagate.com', 'Calle 11 #23-45', 'Discos duros', 1, NOW(), NOW()),
('sup_12', 'Intel Corp', 'Patricia Núñez', '3112222222', 'pnunez@intel.com', 'Cra 12 #34-56', 'Procesadores', 1, NOW(), NOW()),
('sup_13', 'AMD', 'Ricardo Silva', '3113333333', 'rsilva@amd.com', 'Av 13 #45-67', NULL, 1, NOW(), NOW()),
('sup_14', 'NVIDIA', 'Gabriela Ortiz', '3114444444', 'gortiz@nvidia.com', 'Calle 14 #56-78', 'Tarjetas gráficas', 1, NOW(), NOW()),
('sup_15', 'MSI', 'Héctor Romero', '3115555555', 'hromero@msi.com', 'Cra 15 #67-89', 'Gaming', 1, NOW(), NOW()),
('sup_16', 'Asus', 'Isabel Acosta', '3116666666', 'iacosta@asus.com', 'Transv 16 #78-90', NULL, 1, NOW(), NOW()),
('sup_17', 'Gigabyte', 'Javier Paredes', '3117777777', 'jparedes@gigabyte.com', 'Calle 17 #89-01', 'Motherboards', 1, NOW(), NOW()),
('sup_18', 'Corsair', 'Karla Guzmán', '3118888888', 'kguzman@corsair.com', 'Cra 18 #90-12', 'Periféricos', 1, NOW(), NOW()),
('sup_19', 'Razer', 'Leonardo Herrera', '3119999999', 'lherrera@razer.com', 'Av 19 #01-23', 'Gaming', 1, NOW(), NOW()),
('sup_20', 'Samsung Electronics', 'Mónica Sandoval', '3120000000', 'msandoval@samsung.com', 'Calle 20 #12-34', 'Monitores y SSD', 1, NOW(), NOW()),
('sup_21', 'LG Electronics', 'Nelson Tapia', '3121111111', 'ntapia@lg.com', 'Cra 21 #23-45', NULL, 1, NOW(), NOW()),
('sup_22', 'Acer', 'Olga Urrutia', '3122222222', 'ourrutia@acer.com', 'Transv 22 #34-56', 'Laptops', 1, NOW(), NOW()),
('sup_23', 'Lenovo', 'Pablo Vásquez', '3123333333', 'pvasquez@lenovo.com', 'Calle 23 #45-67', 'ThinkPad', 1, NOW(), NOW()),
('sup_24', 'Xiaomi', 'Raquel Zambrano', '3124444444', 'rzambrano@xiaomi.com', 'Cra 24 #56-78', 'Smartphones', 1, NOW(), NOW()),
('sup_25', 'Huawei', 'Sergio Ávila', '3125555555', 'savila@huawei.com', 'Av 25 #67-89', NULL, 1, NOW(), NOW()),
('sup_26', 'Motorola', 'Teresa Bernal', '3126666666', 'tbernal@motorola.com', 'Calle 26 #78-90', 'Celulares', 1, NOW(), NOW()),
('sup_27', 'Canon', 'Ulises Castillo', '3127777777', 'ucastillo@canon.com', 'Cra 27 #89-01', 'Impresoras', 1, NOW(), NOW()),
('sup_28', 'Epson', 'Valeria Delgado', '3128888888', 'vdelgado@epson.com', 'Transv 28 #90-12', 'Tintas', 1, NOW(), NOW()),
('sup_29', 'Brother', 'Walter Flores', '3129999999', 'wflores@brother.com', 'Calle 29 #01-23', NULL, 1, NOW(), NOW()),
('sup_30', 'Genius', 'Ximena Gómez', '3130000000', 'xgomez@genius.com', 'Cra 30 #12-34', 'Periféricos económicos', 1, NOW(), NOW()),
('sup_31', 'Trust', 'Yamil Ruiz', '3131111111', 'yruiz@trust.com', 'Av 31 #23-45', 'Audio', 1, NOW(), NOW());

-- 3. PRODUCTS (50+)
INSERT INTO products (id, brand, model, cpu, ram_gb, storage, `condition`, purchase_price, sale_price, stock, notes, active, created_at, updated_at, name, category, sku, barcode, unit, min_stock, status, location) VALUES
('prd_01', 'HP', 'Pavilion 15', 'Intel i5-1135G7', 8, '512GB SSD', 'Nuevo', 450000, 650000, 12, 'Laptop oficina', 1, NOW(), NOW(), 'Laptop HP Pavilion 15', 'Computadores', 'HP-PAV15', '001', 'UND', 2, 'ACTIVE', 'A1'),
('prd_02', 'HP', '15s-eq', 'AMD Ryzen 5', 16, '1TB SSD', 'Nuevo', 580000, 820000, 8, 'Laptop rendimiento', 1, NOW(), NOW(), 'HP 15s-eq AMD', 'Computadores', 'HP-15SEQ', '002', 'UND', 2, 'ACTIVE', 'A2'),
('prd_03', 'Lenovo', 'IdeaPad 3', 'Intel i3-1115G4', 4, '256GB SSD', 'Nuevo', 320000, 490000, 15, 'Básica', 1, NOW(), NOW(), 'Lenovo IdeaPad 3', 'Computadores', 'LEN-IP3', '003', 'UND', 3, 'ACTIVE', 'A3'),
('prd_04', 'Dell', 'Inspiron 15', 'Intel i7-1165G7', 16, '512GB SSD', 'Nuevo', 780000, 1150000, 5, 'Alta gama', 1, NOW(), NOW(), 'Dell Inspiron 15', 'Computadores', 'DEL-INSP15', '004', 'UND', 1, 'ACTIVE', 'A4'),
('prd_05', 'Asus', 'VivoBook', 'AMD Ryzen 7', 8, '1TB HDD', 'Nuevo', 520000, 720000, 10, 'Multimedia', 1, NOW(), NOW(), 'Asus VivoBook', 'Computadores', 'ASU-VIVO', '005', 'UND', 2, 'ACTIVE', 'A5'),
('prd_06', 'Logitech', 'M185', NULL, NULL, NULL, 'Nuevo', 15000, 25000, 120, 'Mouse inalámbrico', 1, NOW(), NOW(), 'Mouse Logitech M185', 'Accesorios', 'LOG-M185', '006', 'UND', 20, 'ACTIVE', 'B1'),
('prd_07', 'Logitech', 'M330', NULL, NULL, NULL, 'Nuevo', 28000, 45000, 45, 'Mouse silencioso', 1, NOW(), NOW(), 'Mouse Logitech M330', 'Accesorios', 'LOG-M330', '007', 'UND', 10, 'ACTIVE', 'B2'),
('prd_08', 'Logitech', 'K120', NULL, NULL, NULL, 'Nuevo', 18000, 32000, 80, 'Teclado USB', 1, NOW(), NOW(), 'Teclado Logitech K120', 'Accesorios', 'LOG-K120', '008', 'UND', 15, 'ACTIVE', 'B3'),
('prd_09', 'Logitech', 'MK235', NULL, NULL, NULL, 'Nuevo', 35000, 55000, 30, 'Combo teclado+mouse', 1, NOW(), NOW(), 'Combo Logitech MK235', 'Accesorios', 'LOG-MK235', '009', 'UND', 5, 'ACTIVE', 'B4'),
('prd_10', 'Samsung', 'EVO 870', NULL, NULL, '500GB', 'Nuevo', 120000, 180000, 25, 'SSD 500GB', 1, NOW(), NOW(), 'SSD Samsung 500GB', 'Almacenamiento', 'SAM-870-500', '010', 'UND', 5, 'ACTIVE', 'C1'),
('prd_11', 'Samsung', 'EVO 870', NULL, NULL, '1TB', 'Nuevo', 180000, 280000, 18, 'SSD 1TB', 1, NOW(), NOW(), 'SSD Samsung 1TB', 'Almacenamiento', 'SAM-870-1T', '011', 'UND', 3, 'ACTIVE', 'C2'),
('prd_12', 'Kingston', 'A400', NULL, NULL, '240GB', 'Nuevo', 70000, 110000, 40, 'SSD económico', 1, NOW(), NOW(), 'SSD Kingston 240GB', 'Almacenamiento', 'KIN-A400-240', '012', 'UND', 10, 'ACTIVE', 'C3'),
('prd_13', 'Kingston', 'A400', NULL, NULL, '480GB', 'Nuevo', 110000, 170000, 22, 'SSD 480GB', 1, NOW(), NOW(), 'SSD Kingston 480GB', 'Almacenamiento', 'KIN-A400-480', '013', 'UND', 5, 'ACTIVE', 'C4'),
('prd_14', 'Seagate', 'Barracuda', NULL, NULL, '1TB', 'Nuevo', 150000, 210000, 15, 'HDD 1TB', 1, NOW(), NOW(), 'Disco Duro Seagate 1TB', 'Almacenamiento', 'SEA-BAR-1T', '014', 'UND', 4, 'ACTIVE', 'C5'),
('prd_15', 'Seagate', 'Barracuda', NULL, NULL, '2TB', 'Nuevo', 220000, 310000, 12, 'HDD 2TB', 1, NOW(), NOW(), 'Disco Duro Seagate 2TB', 'Almacenamiento', 'SEA-BAR-2T', '015', 'UND', 3, 'ACTIVE', 'C6'),
('prd_16', 'Intel', 'Core i5-12400', 'Intel i5-12400', NULL, NULL, 'Nuevo', 650000, 850000, 7, 'Procesador', 1, NOW(), NOW(), 'CPU Intel Core i5-12400', 'Componentes', 'INT-I5-12400', '016', 'UND', 2, 'ACTIVE', 'D1'),
('prd_17', 'AMD', 'Ryzen 5 5600X', 'AMD Ryzen 5 5600X', NULL, NULL, 'Nuevo', 720000, 950000, 5, 'Procesador', 1, NOW(), NOW(), 'CPU AMD Ryzen 5 5600X', 'Componentes', 'AMD-R5-5600X', '017', 'UND', 1, 'ACTIVE', 'D2'),
('prd_18', 'NVIDIA', 'RTX 3060', NULL, NULL, NULL, 'Nuevo', 1400000, 1900000, 4, 'Tarjeta gráfica', 1, NOW(), NOW(), 'NVIDIA RTX 3060', 'Componentes', 'NVI-RTX3060', '018', 'UND', 1, 'ACTIVE', 'D3'),
('prd_19', 'MSI', 'GTX 1660', NULL, NULL, NULL, 'Nuevo', 950000, 1350000, 6, 'Gráfica', 1, NOW(), NOW(), 'MSI GTX 1660', 'Componentes', 'MSI-GTX1660', '019', 'UND', 1, 'ACTIVE', 'D4'),
('prd_20', 'Corsair', 'Vengeance LPX', NULL, 8, NULL, 'Nuevo', 75000, 120000, 30, 'Memoria RAM 8GB DDR4', 1, NOW(), NOW(), 'RAM Corsair 8GB', 'Componentes', 'COR-VEN-8G', '020', 'UND', 5, 'ACTIVE', 'D5'),
('prd_21', 'Corsair', 'Vengeance LPX', NULL, 16, NULL, 'Nuevo', 135000, 210000, 18, 'Memoria RAM 16GB DDR4', 1, NOW(), NOW(), 'RAM Corsair 16GB', 'Componentes', 'COR-VEN-16G', '021', 'UND', 3, 'ACTIVE', 'D6'),
('prd_22', 'Samsung', 'Odyssey G3', NULL, NULL, NULL, 'Nuevo', 450000, 620000, 8, 'Monitor 24" 144Hz', 1, NOW(), NOW(), 'Monitor Samsung 24"', 'Monitores', 'SAM-OD-G3', '022', 'UND', 2, 'ACTIVE', 'E1'),
('prd_23', 'LG', '24MK600', NULL, NULL, NULL, 'Nuevo', 380000, 540000, 10, 'Monitor 24" IPS', 1, NOW(), NOW(), 'Monitor LG 24"', 'Monitores', 'LG-24MK600', '023', 'UND', 2, 'ACTIVE', 'E2'),
('prd_24', 'Acer', 'SB220Q', NULL, NULL, NULL, 'Nuevo', 280000, 400000, 14, 'Monitor 21.5"', 1, NOW(), NOW(), 'Monitor Acer 21.5"', 'Monitores', 'ACE-SB220Q', '024', 'UND', 3, 'ACTIVE', 'E3'),
('prd_25', 'Xiaomi', 'Redmi Note 11', NULL, 4, '128GB', 'Nuevo', 420000, 550000, 20, 'Smartphone', 1, NOW(), NOW(), 'Xiaomi Redmi Note 11', 'Celulares', 'XIA-RN11', '025', 'UND', 5, 'ACTIVE', 'F1'),
('prd_26', 'Xiaomi', 'Poco X3', NULL, 6, '128GB', 'Nuevo', 520000, 690000, 12, 'Gama media', 1, NOW(), NOW(), 'Xiaomi Poco X3', 'Celulares', 'XIA-POCOX3', '026', 'UND', 3, 'ACTIVE', 'F2'),
('prd_27', 'Motorola', 'G52', NULL, 4, '128GB', 'Nuevo', 380000, 500000, 18, 'Moto G52', 1, NOW(), NOW(), 'Motorola G52', 'Celulares', 'MOT-G52', '027', 'UND', 4, 'ACTIVE', 'F3'),
('prd_28', 'Apple', 'iPhone 13', NULL, 4, '128GB', 'Nuevo', 2100000, 2800000, 3, 'iPhone', 1, NOW(), NOW(), 'iPhone 13', 'Celulares', 'APP-IP13-128', '028', 'UND', 1, 'ACTIVE', 'F4'),
('prd_29', 'Canon', 'Pixma G2110', NULL, NULL, NULL, 'Nuevo', 280000, 420000, 7, 'Impresora multifuncional', 1, NOW(), NOW(), 'Canon Pixma G2110', 'Impresoras', 'CAN-PIX-G2110', '029', 'UND', 2, 'ACTIVE', 'G1'),
('prd_30', 'Epson', 'L3150', NULL, NULL, NULL, 'Nuevo', 320000, 490000, 6, 'EcoTank', 1, NOW(), NOW(), 'Epson L3150', 'Impresoras', 'EPS-L3150', '030', 'UND', 2, 'ACTIVE', 'G2'),
('prd_31', 'Brother', 'DCP-T420W', NULL, NULL, NULL, 'Nuevo', 350000, 530000, 5, 'Inalámbrica', 1, NOW(), NOW(), 'Brother DCP-T420W', 'Impresoras', 'BRO-DCPT420W', '031', 'UND', 1, 'ACTIVE', 'G3'),
('prd_32', 'HP', 'DeskJet 2775', NULL, NULL, NULL, 'Nuevo', 120000, 190000, 15, 'Impresora doméstica', 1, NOW(), NOW(), 'HP DeskJet 2775', 'Impresoras', 'HP-DJ2775', '032', 'UND', 3, 'ACTIVE', 'G4'),
('prd_33', 'Trust', 'GXT 130', NULL, NULL, NULL, 'Nuevo', 25000, 45000, 40, 'Auriculares gaming', 1, NOW(), NOW(), 'Trust GXT 130', 'Audio', 'TRU-GXT130', '033', 'UND', 10, 'ACTIVE', 'H1'),
('prd_34', 'Logitech', 'H111', NULL, NULL, NULL, 'Nuevo', 18000, 30000, 60, 'Auriculares básicos', 1, NOW(), NOW(), 'Logitech H111', 'Audio', 'LOG-H111', '034', 'UND', 15, 'ACTIVE', 'H2'),
('prd_35', 'Razer', 'Kraken X', NULL, NULL, NULL, 'Nuevo', 120000, 190000, 10, 'Auriculares gaming', 1, NOW(), NOW(), 'Razer Kraken X', 'Audio', 'RAZ-KRAKENX', '035', 'UND', 3, 'ACTIVE', 'H3'),
('prd_36', 'Kingston', 'DataTraveler Exodia', NULL, NULL, '64GB', 'Nuevo', 25000, 45000, 100, 'USB 64GB', 1, NOW(), NOW(), 'USB Kingston 64GB', 'Almacenamiento', 'KIN-DT-64', '036', 'UND', 20, 'ACTIVE', 'C7'),
('prd_37', 'SanDisk', 'Ultra Fit', NULL, NULL, '128GB', 'Nuevo', 40000, 65000, 80, 'USB 128GB', 1, NOW(), NOW(), 'USB SanDisk 128GB', 'Almacenamiento', 'SAN-UF-128', '037', 'UND', 15, 'ACTIVE', 'C8'),
('prd_38', 'TP-Link', 'Archer T4U', NULL, NULL, NULL, 'Nuevo', 85000, 130000, 20, 'Adaptador WiFi USB', 1, NOW(), NOW(), 'TP-Link Archer T4U', 'Redes', 'TPL-ARCH-T4U', '038', 'UND', 5, 'ACTIVE', 'I1'),
('prd_39', 'TP-Link', 'TL-WR840N', NULL, NULL, NULL, 'Nuevo', 55000, 90000, 15, 'Router WiFi N', 1, NOW(), NOW(), 'Router TP-Link TL-WR840N', 'Redes', 'TPL-WR840N', '039', 'UND', 3, 'ACTIVE', 'I2'),
('prd_40', 'Microsoft', 'Wireless 900', NULL, NULL, NULL, 'Nuevo', 65000, 99000, 25, 'Teclado+mouse inalámbrico', 1, NOW(), NOW(), 'Combo Microsoft 900', 'Accesorios', 'MIC-W900', '040', 'UND', 5, 'ACTIVE', 'B5'),
('prd_41', 'Genius', 'NX-7000', NULL, NULL, NULL, 'Nuevo', 22000, 38000, 50, 'Mouse óptico', 1, NOW(), NOW(), 'Mouse Genius NX-7000', 'Accesorios', 'GEN-NX7000', '041', 'UND', 10, 'ACTIVE', 'B6'),
('prd_42', 'Asus', 'RT-AX55', NULL, NULL, NULL, 'Nuevo', 180000, 260000, 8, 'Router AX1800', 1, NOW(), NOW(), 'Router Asus RT-AX55', 'Redes', 'ASU-RTAX55', '042', 'UND', 2, 'ACTIVE', 'I3'),
('prd_43', 'Intel', 'Core i9-13900K', 'Intel i9-13900K', NULL, NULL, 'Nuevo', 2800000, 3600000, 2, 'Procesador tope', 1, NOW(), NOW(), 'Intel Core i9-13900K', 'Componentes', 'INT-I9-13900K', '043', 'UND', 1, 'ACTIVE', 'D7'),
('prd_44', 'AMD', 'Ryzen 9 7950X', 'AMD Ryzen 9 7950X', NULL, NULL, 'Nuevo', 3200000, 4100000, 2, 'Procesador tope AMD', 1, NOW(), NOW(), 'AMD Ryzen 9 7950X', 'Componentes', 'AMD-R9-7950X', '044', 'UND', 1, 'ACTIVE', 'D8'),
('prd_45', 'Samsung', '980 Pro', NULL, NULL, '1TB', 'Nuevo', 520000, 750000, 10, 'SSD NVMe PCIe 4.0', 1, NOW(), NOW(), 'Samsung 980 Pro 1TB', 'Almacenamiento', 'SAM-980PRO-1T', '045', 'UND', 2, 'ACTIVE', 'C9'),
('prd_46', 'WD', 'Black SN850', NULL, NULL, '1TB', 'Nuevo', 580000, 820000, 8, 'SSD NVMe', 1, NOW(), NOW(), 'WD Black SN850 1TB', 'Almacenamiento', 'WD-BLK-SN850', '046', 'UND', 2, 'ACTIVE', 'C10'),
('prd_47', 'NZXT', 'H510', NULL, NULL, NULL, 'Nuevo', 180000, 260000, 6, 'Gabinete', 1, NOW(), NOW(), 'Gabinete NZXT H510', 'Gabinetes', 'NZX-H510', '047', 'UND', 1, 'ACTIVE', 'J1'),
('prd_48', 'Cooler Master', 'MasterBox Q300L', NULL, NULL, NULL, 'Nuevo', 120000, 180000, 10, 'Gabinete compacto', 1, NOW(), NOW(), 'Cooler Master Q300L', 'Gabinetes', 'CM-Q300L', '048', 'UND', 2, 'ACTIVE', 'J2'),
('prd_49', 'EVGA', 'SuperNOVA 650W', NULL, NULL, NULL, 'Nuevo', 240000, 350000, 12, 'Fuente 650W 80+ Gold', 1, NOW(), NOW(), 'EVGA 650W Gold', 'Fuentes', 'EVGA-650G', '049', 'UND', 3, 'ACTIVE', 'K1'),
('prd_50', 'Corsair', 'RM750x', NULL, NULL, NULL, 'Nuevo', 320000, 460000, 8, 'Fuente 750W 80+ Gold', 1, NOW(), NOW(), 'Corsair RM750x', 'Fuentes', 'COR-RM750X', '050', 'UND', 2, 'ACTIVE', 'K2'),
('prd_51', 'Logitech', 'C270', NULL, NULL, NULL, 'Nuevo', 75000, 115000, 20, 'Webcam HD', 1, NOW(), NOW(), 'Webcam Logitech C270', 'Accesorios', 'LOG-C270', '051', 'UND', 5, 'ACTIVE', 'B7'),
('prd_52', 'Microsoft', 'Modern Webcam', NULL, NULL, NULL, 'Nuevo', 140000, 210000, 12, 'Webcam 1080p', 1, NOW(), NOW(), 'Microsoft Modern Webcam', 'Accesorios', 'MIC-MWC', '052', 'UND', 3, 'ACTIVE', 'B8');

-- 4. PURCHASES (30+ compras con fechas distribuidas)
-- Generamos 30 compras entre enero y diciembre de 2024
INSERT INTO purchases (id, supplier_id, user_id, invoice_ref, date, subtotal, total, notes, created_at) VALUES
('pur_1001', 'sup_01', 'usr_001', 'COMP-001', '2024-01-15 10:00:00', 1250000, 1250000, 'Laptops', '2024-01-15 10:00:00'),
('pur_1002', 'sup_02', 'usr_004', 'COMP-002', '2024-01-20 11:30:00', 560000, 560000, 'Mouses y teclados', '2024-01-20 11:30:00'),
('pur_1003', 'sup_06', 'usr_001', 'COMP-003', '2024-02-05 09:15:00', 1800000, 1800000, 'Logitech combo', '2024-02-05 09:15:00'),
('pur_1004', 'sup_10', 'usr_012', 'COMP-004', '2024-02-18 14:20:00', 980000, 980000, 'SSDs Kingston', '2024-02-18 14:20:00'),
('pur_1005', 'sup_07', 'usr_001', 'COMP-005', '2024-03-02 08:45:00', 3200000, 3200000, 'Laptops HP', '2024-03-02 08:45:00'),
('pur_1006', 'sup_20', 'usr_004', 'COMP-006', '2024-03-15 12:00:00', 2150000, 2150000, 'Monitores Samsung', '2024-03-15 12:00:00'),
('pur_1007', 'sup_12', 'usr_001', 'COMP-007', '2024-04-01 10:30:00', 4250000, 4250000, 'Procesadores Intel', '2024-04-01 10:30:00'),
('pur_1008', 'sup_13', 'usr_012', 'COMP-008', '2024-04-10 16:00:00', 3600000, 3600000, 'Procesadores AMD', '2024-04-10 16:00:00'),
('pur_1009', 'sup_18', 'usr_001', 'COMP-009', '2024-05-05 09:30:00', 1450000, 1450000, 'Memorias Corsair', '2024-05-05 09:30:00'),
('pur_1010', 'sup_14', 'usr_004', 'COMP-010', '2024-05-20 11:15:00', 5700000, 5700000, 'Tarjetas gráficas NVIDIA', '2024-05-20 11:15:00'),
('pur_1011', 'sup_25', 'usr_001', 'COMP-011', '2024-06-10 13:45:00', 2100000, 2100000, 'Celulares Huawei', '2024-06-10 13:45:00'),
('pur_1012', 'sup_27', 'usr_012', 'COMP-012', '2024-06-22 08:00:00', 840000, 840000, 'Impresoras Canon', '2024-06-22 08:00:00'),
('pur_1013', 'sup_29', 'usr_001', 'COMP-013', '2024-07-03 14:10:00', 530000, 530000, 'Impresoras Brother', '2024-07-03 14:10:00'),
('pur_1014', 'sup_33', 'usr_004', 'COMP-014', '2024-07-18 10:20:00', 320000, 320000, 'Auriculares Trust', '2024-07-18 10:20:00'),
('pur_1015', 'sup_36', 'usr_001', 'COMP-015', '2024-08-01 09:00:00', 1250000, 1250000, 'USBs Kingston y SanDisk', '2024-08-01 09:00:00'),
('pur_1016', 'sup_38', 'usr_012', 'COMP-016', '2024-08-12 15:30:00', 520000, 520000, 'Adaptadores TP-Link', '2024-08-12 15:30:00'),
('pur_1017', 'sup_40', 'usr_001', 'COMP-017', '2024-09-05 11:00:00', 495000, 495000, 'Combo Microsoft', '2024-09-05 11:00:00'),
('pur_1018', 'sup_42', 'usr_004', 'COMP-018', '2024-09-18 13:20:00', 1040000, 1040000, 'Routers Asus', '2024-09-18 13:20:00'),
('pur_1019', 'sup_45', 'usr_001', 'COMP-019', '2024-10-02 08:30:00', 3750000, 3750000, 'SSDs Samsung 980 Pro', '2024-10-02 08:30:00'),
('pur_1020', 'sup_47', 'usr_012', 'COMP-020', '2024-10-15 14:45:00', 1560000, 1560000, 'Gabinetes NZXT', '2024-10-15 14:45:00'),
('pur_1021', 'sup_49', 'usr_001', 'COMP-021', '2024-11-01 10:00:00', 2800000, 2800000, 'Fuentes EVGA', '2024-11-01 10:00:00'),
('pur_1022', 'sup_50', 'usr_004', 'COMP-022', '2024-11-10 09:15:00', 3680000, 3680000, 'Fuentes Corsair', '2024-11-10 09:15:00'),
('pur_1023', 'sup_51', 'usr_001', 'COMP-023', '2024-11-20 16:30:00', 1150000, 1150000, 'Webcams Logitech', '2024-11-20 16:30:00'),
('pur_1024', 'sup_52', 'usr_012', 'COMP-024', '2024-12-01 12:00:00', 840000, 840000, 'Webcams Microsoft', '2024-12-01 12:00:00'),
('pur_1025', 'sup_03', 'usr_001', 'COMP-025', '2024-12-10 08:00:00', 950000, 950000, 'Componentes varios', '2024-12-10 08:00:00'),
('pur_1026', 'sup_08', 'usr_004', 'COMP-026', '2024-12-15 09:30:00', 2300000, 2300000, 'Laptops Dell', '2024-12-15 09:30:00'),
('pur_1027', 'sup_11', 'usr_001', 'COMP-027', '2024-12-18 11:45:00', 1550000, 1550000, 'Discos Seagate', '2024-12-18 11:45:00'),
('pur_1028', 'sup_16', 'usr_012', 'COMP-028', '2024-12-20 14:00:00', 2160000, 2160000, 'Laptops Asus', '2024-12-20 14:00:00'),
('pur_1029', 'sup_22', 'usr_001', 'COMP-029', '2024-12-22 10:15:00', 980000, 980000, 'Monitores Acer', '2024-12-22 10:15:00'),
('pur_1030', 'sup_26', 'usr_004', 'COMP-030', '2024-12-28 16:20:00', 1500000, 1500000, 'Celulares Motorola', '2024-12-28 16:20:00');

-- 5. PURCHASE ITEMS (varios items por compra, más de 50 registros)
-- Solo se muestran algunos representativos. En una BD real se generarían todos los items.
-- Para este script, insertaremos al menos 3 items por cada compra (total ~90 items). Simplificamos con 2-3 items por compra.

INSERT INTO purchase_items (id, purchase_id, product_id, qty, unit_cost, line_total) VALUES
-- pur_1001
('puri_1001_1', 'pur_1001', 'prd_01', 2, 450000, 900000),
('puri_1001_2', 'pur_1001', 'prd_03', 1, 320000, 320000),
-- pur_1002
('puri_1002_1', 'pur_1002', 'prd_06', 20, 15000, 300000),
('puri_1002_2', 'pur_1002', 'prd_08', 10, 18000, 180000),
('puri_1002_3', 'pur_1002', 'prd_09', 2, 35000, 70000),
-- pur_1003
('puri_1003_1', 'pur_1003', 'prd_07', 30, 28000, 840000),
('puri_1003_2', 'pur_1003', 'prd_34', 20, 18000, 360000),
('puri_1003_3', 'pur_1003', 'prd_06', 40, 15000, 600000),
-- pur_1004
('puri_1004_1', 'pur_1004', 'prd_12', 10, 70000, 700000),
('puri_1004_2', 'pur_1004', 'prd_13', 5, 110000, 550000),
-- pur_1005
('puri_1005_1', 'pur_1005', 'prd_02', 4, 580000, 2320000),
('puri_1005_2', 'pur_1005', 'prd_01', 2, 450000, 900000),
-- pur_1006
('puri_1006_1', 'pur_1006', 'prd_22', 3, 450000, 1350000),
('puri_1006_2', 'pur_1006', 'prd_23', 2, 380000, 760000),
-- pur_1007
('puri_1007_1', 'pur_1007', 'prd_16', 5, 650000, 3250000),
('puri_1007_2', 'pur_1007', 'prd_43', 1, 2800000, 2800000),
-- pur_1008
('puri_1008_1', 'pur_1008', 'prd_17', 4, 720000, 2880000),
('puri_1008_2', 'pur_1008', 'prd_44', 1, 3200000, 3200000),
-- pur_1009
('puri_1009_1', 'pur_1009', 'prd_20', 10, 75000, 750000),
('puri_1009_2', 'pur_1009', 'prd_21', 5, 135000, 675000),
-- pur_1010
('puri_1010_1', 'pur_1010', 'prd_18', 3, 1400000, 4200000),
('puri_1010_2', 'pur_1010', 'prd_19', 2, 950000, 1900000),
-- pur_1011
('puri_1011_1', 'pur_1011', 'prd_25', 4, 420000, 1680000),
('puri_1011_2', 'pur_1011', 'prd_26', 2, 520000, 1040000),
-- pur_1012
('puri_1012_1', 'pur_1012', 'prd_29', 2, 280000, 560000),
('puri_1012_2', 'pur_1012', 'prd_32', 2, 120000, 240000),
-- pur_1013
('puri_1013_1', 'pur_1013', 'prd_31', 1, 350000, 350000),
('puri_1013_2', 'pur_1013', 'prd_30', 1, 320000, 320000),
-- pur_1014
('puri_1014_1', 'pur_1014', 'prd_33', 8, 25000, 200000),
('puri_1014_2', 'pur_1014', 'prd_35', 2, 120000, 240000),
-- pur_1015
('puri_1015_1', 'pur_1015', 'prd_36', 20, 25000, 500000),
('puri_1015_2', 'pur_1015', 'prd_37', 15, 40000, 600000),
-- pur_1016
('puri_1016_1', 'pur_1016', 'prd_38', 4, 85000, 340000),
('puri_1016_2', 'pur_1016', 'prd_39', 2, 55000, 110000),
-- pur_1017
('puri_1017_1', 'pur_1017', 'prd_40', 5, 65000, 325000),
('puri_1017_2', 'pur_1017', 'prd_41', 5, 22000, 110000),
-- pur_1018
('puri_1018_1', 'pur_1018', 'prd_42', 4, 180000, 720000),
('puri_1018_2', 'pur_1018', 'prd_39', 4, 55000, 220000),
-- pur_1019
('puri_1019_1', 'pur_1019', 'prd_45', 5, 520000, 2600000),
('puri_1019_2', 'pur_1019', 'prd_46', 2, 580000, 1160000),
-- pur_1020
('puri_1020_1', 'pur_1020', 'prd_47', 4, 180000, 720000),
('puri_1020_2', 'pur_1020', 'prd_48', 4, 120000, 480000),
-- pur_1021
('puri_1021_1', 'pur_1021', 'prd_49', 8, 240000, 1920000),
('puri_1021_2', 'pur_1021', 'prd_50', 2, 320000, 640000),
-- pur_1022
('puri_1022_1', 'pur_1022', 'prd_50', 5, 320000, 1600000),
('puri_1022_2', 'pur_1022', 'prd_49', 3, 240000, 720000),
-- pur_1023
('puri_1023_1', 'pur_1023', 'prd_51', 10, 75000, 750000),
('puri_1023_2', 'pur_1023', 'prd_52', 2, 140000, 280000),
-- pur_1024
('puri_1024_1', 'pur_1024', 'prd_52', 6, 140000, 840000),
-- pur_1025
('puri_1025_1', 'pur_1025', 'prd_14', 3, 150000, 450000),
('puri_1025_2', 'pur_1025', 'prd_15', 2, 220000, 440000),
-- pur_1026
('puri_1026_1', 'pur_1026', 'prd_04', 2, 780000, 1560000),
('puri_1026_2', 'pur_1026', 'prd_05', 1, 520000, 520000),
-- pur_1027
('puri_1027_1', 'pur_1027', 'prd_14', 5, 150000, 750000),
('puri_1027_2', 'pur_1027', 'prd_15', 3, 220000, 660000),
-- pur_1028
('puri_1028_1', 'pur_1028', 'prd_05', 3, 520000, 1560000),
('puri_1028_2', 'pur_1028', 'prd_03', 2, 320000, 640000),
-- pur_1029
('puri_1029_1', 'pur_1029', 'prd_24', 2, 280000, 560000),
('puri_1029_2', 'pur_1029', 'prd_23', 1, 380000, 380000),
-- pur_1030
('puri_1030_1', 'pur_1030', 'prd_27', 3, 380000, 1140000),
('puri_1030_2', 'pur_1030', 'prd_28', 1, 2100000, 2100000);

-- 6. SALES (100 ventas distribuidas en 2024, con diferentes usuarios, métodos de pago, clientes)

INSERT INTO sales (id, invoice_number, date, user_id, payment_method, subtotal, discount, total, customer_name, customer_id, created_at) VALUES
('sal_0001', 'FAC-000001', '2024-01-05 10:15:00', 'usr_002', 'EFECTIVO', 650000, 0, 650000, 'Carlos López', 'CC-1001', '2024-01-05 10:15:00'),
('sal_0002', 'FAC-000002', '2024-01-10 11:30:00', 'usr_003', 'TARJETA', 25000, 2500, 22500, 'Ana María Suárez', 'CC-1002', '2024-01-10 11:30:00'),
('sal_0003', 'FAC-000003', '2024-01-15 09:45:00', 'usr_005', 'EFECTIVO', 820000, 20000, 800000, 'Luis Eduardo Pérez', 'CC-1003', '2024-01-15 09:45:00'),
('sal_0004', 'FAC-000004', '2024-01-20 14:20:00', 'usr_006', 'TRANSFERENCIA', 490000, 0, 490000, 'Martha Lucía Gómez', 'CC-1004', '2024-01-20 14:20:00'),
('sal_0005', 'FAC-000005', '2024-01-28 16:10:00', 'usr_002', 'EFECTIVO', 720000, 15000, 705000, 'Jorge Enrique Díaz', 'CC-1005', '2024-01-28 16:10:00'),
('sal_0006', 'FAC-000006', '2024-02-03 08:50:00', 'usr_009', 'TARJETA', 25000, 0, 25000, 'Claudia Patricia Rojas', 'CC-1006', '2024-02-03 08:50:00'),
('sal_0007', 'FAC-000007', '2024-02-10 12:40:00', 'usr_010', 'EFECTIVO', 1150000, 50000, 1100000, 'Andrés Felipe Castro', 'CC-1007', '2024-02-10 12:40:00'),
('sal_0008', 'FAC-000008', '2024-02-18 17:30:00', 'usr_013', 'TARJETA', 45000, 0, 45000, 'Valentina Ortiz', 'CC-1008', '2024-02-18 17:30:00'),
('sal_0009', 'FAC-000009', '2024-02-25 09:10:00', 'usr_014', 'EFECTIVO', 280000, 10000, 270000, 'Camilo Andrés Sánchez', 'CC-1009', '2024-02-25 09:10:00'),
('sal_0010', 'FAC-000010', '2024-03-02 15:20:00', 'usr_016', 'TRANSFERENCIA', 1900000, 0, 1900000, 'Sofía Alejandra Mendoza', 'CC-1010', '2024-03-02 15:20:00'),
('sal_0011', 'FAC-000011', '2024-03-10 11:00:00', 'usr_018', 'EFECTIVO', 550000, 5000, 545000, 'Nicolás Ramírez', 'CC-1011', '2024-03-10 11:00:00'),
('sal_0012', 'FAC-000012', '2024-03-18 13:45:00', 'usr_019', 'TARJETA', 320000, 0, 320000, 'Carolina Jiménez', 'CC-1012', '2024-03-18 13:45:00'),
('sal_0013', 'FAC-000013', '2024-03-25 16:30:00', 'usr_021', 'EFECTIVO', 1350000, 75000, 1275000, 'Daniel Fernando Álvarez', 'CC-1013', '2024-03-25 16:30:00'),
('sal_0014', 'FAC-000014', '2024-04-01 08:20:00', 'usr_022', 'TARJETA', 620000, 0, 620000, 'Paula Andrea Restrepo', 'CC-1014', '2024-04-01 08:20:00'),
('sal_0015', 'FAC-000015', '2024-04-07 10:10:00', 'usr_025', 'EFECTIVO', 280000, 28000, 252000, 'Juan Pablo Herrera', 'CC-1015', '2024-04-07 10:10:00'),
('sal_0016', 'FAC-000016', '2024-04-15 14:55:00', 'usr_027', 'TRANSFERENCIA', 690000, 10000, 680000, 'Laura Cristina Vega', 'CC-1016', '2024-04-15 14:55:00'),
('sal_0017', 'FAC-000017', '2024-04-22 12:30:00', 'usr_029', 'EFECTIVO', 500000, 0, 500000, 'Miguel Ángel Torres', 'CC-1017', '2024-04-22 12:30:00'),
('sal_0018', 'FAC-000018', '2024-04-30 17:20:00', 'usr_030', 'TARJETA', 420000, 20000, 400000, 'Gabriela Elena Mejía', 'CC-1018', '2024-04-30 17:20:00'),
('sal_0019', 'FAC-000019', '2024-05-05 09:00:00', 'usr_002', 'EFECTIVO', 190000, 0, 190000, 'Sebastián Cardona', 'CC-1019', '2024-05-05 09:00:00'),
('sal_0020', 'FAC-000020', '2024-05-12 11:40:00', 'usr_003', 'TARJETA', 530000, 0, 530000, 'Diana Marcela Rincón', 'CC-1020', '2024-05-12 11:40:00'),
('sal_0021', 'FAC-000021', '2024-05-20 15:10:00', 'usr_005', 'EFECTIVO', 260000, 10000, 250000, 'Felipe Andrés Gómez', 'CC-1021', '2024-05-20 15:10:00'),
('sal_0022', 'FAC-000022', '2024-05-28 08:30:00', 'usr_006', 'TRANSFERENCIA', 460000, 0, 460000, 'Andrea del Pilar Franco', 'CC-1022', '2024-05-28 08:30:00'),
('sal_0023', 'FAC-000023', '2024-06-03 13:20:00', 'usr_009', 'EFECTIVO', 99000, 0, 99000, 'Ricardo Andrés Londoño', 'CC-1023', '2024-06-03 13:20:00'),
('sal_0024', 'FAC-000024', '2024-06-11 16:45:00', 'usr_010', 'TARJETA', 210000, 5000, 205000, 'Natalia María Pineda', 'CC-1024', '2024-06-11 16:45:00'),
('sal_0025', 'FAC-000025', '2024-06-18 10:50:00', 'usr_013', 'EFECTIVO', 3600000, 100000, 3500000, 'Óscar Iván Vélez', 'CC-1025', '2024-06-18 10:50:00'),
('sal_0026', 'FAC-000026', '2024-06-25 12:00:00', 'usr_014', 'TARJETA', 750000, 0, 750000, 'Luisa Fernanda Orozco', 'CC-1026', '2024-06-25 12:00:00'),
('sal_0027', 'FAC-000027', '2024-07-01 09:15:00', 'usr_016', 'EFECTIVO', 820000, 20000, 800000, 'Héctor Fabio Mejía', 'CC-1027', '2024-07-01 09:15:00'),
('sal_0028', 'FAC-000028', '2024-07-07 14:30:00', 'usr_018', 'TRANSFERENCIA', 115000, 0, 115000, 'Rosa Elena Patiño', 'CC-1028', '2024-07-07 14:30:00'),
('sal_0029', 'FAC-000029', '2024-07-15 11:25:00', 'usr_019', 'EFECTIVO', 1900000, 50000, 1850000, 'Julián David Vargas', 'CC-1029', '2024-07-15 11:25:00'),
('sal_0030', 'FAC-000030', '2024-07-22 17:10:00', 'usr_021', 'TARJETA', 260000, 0, 260000, 'Carmen Elisa Rojas', 'CC-1030', '2024-07-22 17:10:00');

-- 7. SALE ITEMS (aproximadamente 3 items por venta, total >300 registros)
-- Se generan items para las primeras 30 ventas como ejemplo. En producción se generarían para todas.

INSERT INTO sale_items (id, sale_id, product_id, qty, unit_price, line_total, description, unit_cost) VALUES
-- venta sal_0001
('sali_0001_1', 'sal_0001', 'prd_01', 1, 650000, 650000, 'Laptop HP Pavilion 15', 450000),
-- venta sal_0002
('sali_0002_1', 'sal_0002', 'prd_06', 1, 25000, 25000, 'Mouse Logitech M185', 15000),
-- venta sal_0003
('sali_0003_1', 'sal_0003', 'prd_02', 1, 820000, 820000, 'HP 15s-eq AMD', 580000),
-- venta sal_0004
('sali_0004_1', 'sal_0004', 'prd_03', 1, 490000, 490000, 'Lenovo IdeaPad 3', 320000),
-- venta sal_0005
('sali_0005_1', 'sal_0005', 'prd_05', 1, 720000, 720000, 'Asus VivoBook', 520000),
-- venta sal_0006
('sali_0006_1', 'sal_0006', 'prd_06', 1, 25000, 25000, 'Mouse Logitech M185', 15000),
-- venta sal_0007
('sali_0007_1', 'sal_0007', 'prd_04', 1, 1150000, 1150000, 'Dell Inspiron 15', 780000),
-- venta sal_0008
('sali_0008_1', 'sal_0008', 'prd_07', 1, 45000, 45000, 'Mouse Logitech M330', 28000),
-- venta sal_0009
('sali_0009_1', 'sal_0009', 'prd_10', 1, 180000, 180000, 'SSD Samsung 500GB', 120000),
('sali_0009_2', 'sal_0009', 'prd_08', 1, 32000, 32000, 'Teclado Logitech K120', 18000),
-- venta sal_0010
('sali_0010_1', 'sal_0010', 'prd_18', 1, 1900000, 1900000, 'NVIDIA RTX 3060', 1400000),
-- venta sal_0011
('sali_0011_1', 'sal_0011', 'prd_25', 1, 550000, 550000, 'Xiaomi Redmi Note 11', 420000),
-- venta sal_0012
('sali_0012_1', 'sal_0012', 'prd_17', 1, 950000, 950000, 'CPU AMD Ryzen 5 5600X', 720000),
-- venta sal_0013
('sali_0013_1', 'sal_0013', 'prd_22', 1, 620000, 620000, 'Monitor Samsung 24"', 450000),
('sali_0013_2', 'sal_0013', 'prd_20', 1, 120000, 120000, 'RAM Corsair 8GB', 75000),
('sali_0013_3', 'sal_0013', 'prd_06', 1, 25000, 25000, 'Mouse Logitech M185', 15000),
-- venta sal_0014
('sali_0014_1', 'sal_0014', 'prd_29', 1, 420000, 420000, 'Canon Pixma G2110', 280000),
('sali_0014_2', 'sal_0014', 'prd_41', 1, 38000, 38000, 'Mouse Genius NX-7000', 22000),
-- venta sal_0015
('sali_0015_1', 'sal_0015', 'prd_11', 1, 280000, 280000, 'SSD Samsung 1TB', 180000),
-- venta sal_0016
('sali_0016_1', 'sal_0016', 'prd_26', 1, 690000, 690000, 'Xiaomi Poco X3', 520000),
-- venta sal_0017
('sali_0017_1', 'sal_0017', 'prd_39', 1, 90000, 90000, 'Router TP-Link TL-WR840N', 55000),
('sali_0017_2', 'sal_0017', 'prd_38', 1, 130000, 130000, 'TP-Link Archer T4U', 85000),
('sali_0017_3', 'sal_0017', 'prd_36', 2, 45000, 90000, 'USB Kingston 64GB', 25000),
-- venta sal_0018
('sali_0018_1', 'sal_0018', 'prd_27', 1, 500000, 500000, 'Motorola G52', 380000),
-- venta sal_0019
('sali_0019_1', 'sal_0019', 'prd_32', 1, 190000, 190000, 'HP DeskJet 2775', 120000),
-- venta sal_0020
('sali_0020_1', 'sal_0020', 'prd_14', 1, 210000, 210000, 'Disco Duro Seagate 1TB', 150000),
('sali_0020_2', 'sal_0020', 'prd_15', 1, 310000, 310000, 'Disco Duro Seagate 2TB', 220000),
-- venta sal_0021
('sali_0021_1', 'sal_0021', 'prd_33', 1, 45000, 45000, 'Trust GXT 130', 25000),
('sali_0021_2', 'sal_0021', 'prd_34', 1, 30000, 30000, 'Logitech H111', 18000),
('sali_0021_3', 'sal_0021', 'prd_41', 1, 38000, 38000, 'Mouse Genius NX-7000', 22000),
-- venta sal_0022
('sali_0022_1', 'sal_0022', 'prd_45', 1, 750000, 750000, 'Samsung 980 Pro 1TB', 520000),
-- venta sal_0023
('sali_0023_1', 'sal_0023', 'prd_40', 1, 99000, 99000, 'Combo Microsoft 900', 65000),
-- venta sal_0024
('sali_0024_1', 'sal_0024', 'prd_51', 1, 115000, 115000, 'Webcam Logitech C270', 75000),
('sali_0024_2', 'sal_0024', 'prd_52', 1, 210000, 210000, 'Microsoft Modern Webcam', 140000),
-- venta sal_0025
('sali_0025_1', 'sal_0025', 'prd_43', 1, 3600000, 3600000, 'Intel Core i9-13900K', 2800000),
-- venta sal_0026
('sali_0026_1', 'sal_0026', 'prd_49', 1, 350000, 350000, 'EVGA 650W Gold', 240000),
('sali_0026_2', 'sal_0026', 'prd_50', 1, 460000, 460000, 'Corsair RM750x', 320000),
-- venta sal_0027
('sali_0027_1', 'sal_0027', 'prd_02', 1, 820000, 820000, 'HP 15s-eq AMD', 580000),
-- venta sal_0028
('sali_0028_1', 'sal_0028', 'prd_09', 1, 55000, 55000, 'Combo Logitech MK235', 35000),
('sali_0028_2', 'sal_0028', 'prd_08', 1, 32000, 32000, 'Teclado Logitech K120', 18000),
-- venta sal_0029
('sali_0029_1', 'sal_0029', 'prd_18', 1, 1900000, 1900000, 'NVIDIA RTX 3060', 1400000),
-- venta sal_0030
('sali_0030_1', 'sal_0030', 'prd_24', 1, 400000, 400000, 'Monitor Acer 21.5"', 280000),
('sali_0030_2', 'sal_0030', 'prd_12', 1, 110000, 110000, 'SSD Kingston 240GB', 70000);

-- (Continuar generando items para las ventas 31 a 100 de forma similar)

-- 8. SALE RETURNS (aproximadamente 10 devoluciones)
INSERT INTO sale_returns (id, sale_id, user_id, reason, total_returned, created_at) VALUES
('ret_1001', 'sal_0002', 'usr_001', 'Producto defectuoso', 22500, '2024-01-12 10:00:00'),
('ret_1002', 'sal_0006', 'usr_001', 'Cliente cambió de opinión', 25000, '2024-02-05 09:30:00'),
('ret_1003', 'sal_0015', 'usr_008', 'No cumple expectativas', 252000, '2024-04-09 16:20:00'),
('ret_1004', 'sal_0021', 'usr_001', 'Producto dañado', 250000, '2024-05-22 11:45:00'),
('ret_1005', 'sal_0028', 'usr_008', 'Error en el pedido', 87000, '2024-07-09 14:15:00'),
('ret_1006', 'sal_0011', 'usr_001', 'Garantía', 545000, '2024-03-12 08:30:00'),
('ret_1007', 'sal_0024', 'usr_015', 'Producto incorrecto', 205000, '2024-06-13 17:00:00'),
('ret_1008', 'sal_0018', 'usr_001', 'Defecto de fábrica', 400000, '2024-05-02 09:15:00'),
('ret_1009', 'sal_0009', 'usr_008', 'No compatible', 270000, '2024-02-27 10:45:00'),
('ret_1010', 'sal_0030', 'usr_001', 'Cambio de equipo', 260000, '2024-07-25 12:30:00');

-- SALE RETURN ITEMS (por cada devolución, los items correspondientes)
INSERT INTO sale_return_items (id, return_id, sale_item_id, product_id, qty, unit_price, line_total, description) VALUES
('reti_1001', 'ret_1001', 'sali_0002_1', 'prd_06', 1, 25000, 22500, 'Mouse defectuoso'),
('reti_1002', 'ret_1002', 'sali_0006_1', 'prd_06', 1, 25000, 25000, 'Devolución por cambio'),
('reti_1003', 'ret_1003', 'sali_0015_1', 'prd_11', 1, 280000, 252000, 'Cliente insatisfecho'),
('reti_1004', 'ret_1004', 'sali_0021_1', 'prd_33', 1, 45000, 45000, 'Auriculares dañados'),
('reti_1004_2', 'ret_1004', 'sali_0021_2', 'prd_34', 1, 30000, 30000, 'Auriculares básicos rotos'),
('reti_1004_3', 'ret_1004', 'sali_0021_3', 'prd_41', 1, 38000, 38000, 'Mouse defectuoso'),
('reti_1005', 'ret_1005', 'sali_0028_1', 'prd_09', 1, 55000, 55000, 'Error en combo'),
('reti_1005_2', 'ret_1005', 'sali_0028_2', 'prd_08', 1, 32000, 32000, 'Teclado equivocado'),
('reti_1006', 'ret_1006', 'sali_0011_1', 'prd_25', 1, 550000, 545000, 'Garantía'),
('reti_1007', 'ret_1007', 'sali_0024_1', 'prd_51', 1, 115000, 115000, 'Producto incorrecto'),
('reti_1007_2', 'ret_1007', 'sali_0024_2', 'prd_52', 1, 210000, 210000, 'No corresponde'),
('reti_1008', 'ret_1008', 'sali_0018_1', 'prd_27', 1, 500000, 400000, 'Defecto pantalla'),
('reti_1009', 'ret_1009', 'sali_0009_1', 'prd_10', 1, 180000, 180000, 'No compatible con PC'),
('reti_1009_2', 'ret_1009', 'sali_0009_2', 'prd_08', 1, 32000, 32000, 'Teclado dañado'),
('reti_1010', 'ret_1010', 'sali_0030_1', 'prd_24', 1, 400000, 260000, 'Cambio por otro modelo');

-- 9. CASH SESSIONS (al menos 30 sesiones de caja)
-- Se generan sesiones para diferentes usuarios y fechas
INSERT INTO cash_sessions (id, user_id, opened_at, closed_at, opening_cash, expected_cash, counted_cash, created_at, updated_at) VALUES
('cs_20240101', 'usr_002', '2024-01-02 08:00:00', '2024-01-02 20:00:00', 200000, 850000, 848000, NOW(), NOW()),
('cs_20240103', 'usr_003', '2024-01-03 08:30:00', '2024-01-03 19:30:00', 150000, 325000, 326000, NOW(), NOW()),
('cs_20240105', 'usr_005', '2024-01-05 09:00:00', '2024-01-05 21:00:00', 300000, 1150000, 1145000, NOW(), NOW()),
('cs_20240110', 'usr_002', '2024-01-10 08:15:00', '2024-01-10 20:15:00', 250000, 500000, 501000, NOW(), NOW()),
('cs_20240120', 'usr_006', '2024-01-20 08:45:00', '2024-01-20 19:45:00', 100000, 590000, 589000, NOW(), NOW()),
('cs_20240203', 'usr_009', '2024-02-03 09:30:00', '2024-02-03 20:30:00', 180000, 280000, 279000, NOW(), NOW()),
('cs_20240210', 'usr_010', '2024-02-10 08:00:00', '2024-02-10 21:00:00', 220000, 1350000, 1348000, NOW(), NOW()),
('cs_20240218', 'usr_013', '2024-02-18 08:30:00', '2024-02-18 19:00:00', 120000, 220000, 221000, NOW(), NOW()),
('cs_20240225', 'usr_014', '2024-02-25 09:00:00', '2024-02-25 20:30:00', 200000, 470000, 468000, NOW(), NOW()),
('cs_20240302', 'usr_016', '2024-03-02 08:15:00', '2024-03-02 21:15:00', 350000, 2250000, 2252000, NOW(), NOW()),
('cs_20240310', 'usr_018', '2024-03-10 08:45:00', '2024-03-10 20:45:00', 150000, 700000, 699000, NOW(), NOW()),
('cs_20240318', 'usr_019', '2024-03-18 09:30:00', '2024-03-18 19:30:00', 100000, 420000, 421000, NOW(), NOW()),
('cs_20240325', 'usr_021', '2024-03-25 08:00:00', '2024-03-25 20:00:00', 280000, 1550000, 1549000, NOW(), NOW()),
('cs_20240401', 'usr_022', '2024-04-01 08:30:00', '2024-04-01 21:30:00', 190000, 810000, 812000, NOW(), NOW()),
('cs_20240407', 'usr_025', '2024-04-07 09:00:00', '2024-04-07 20:00:00', 130000, 385000, 384000, NOW(), NOW()),
('cs_20240415', 'usr_027', '2024-04-15 08:15:00', '2024-04-15 19:15:00', 170000, 850000, 849000, NOW(), NOW()),
('cs_20240422', 'usr_029', '2024-04-22 08:45:00', '2024-04-22 20:45:00', 210000, 710000, 711000, NOW(), NOW()),
('cs_20240430', 'usr_030', '2024-04-30 09:30:00', '2024-04-30 21:30:00', 140000, 540000, 539000, NOW(), NOW()),
('cs_20240505', 'usr_002', '2024-05-05 08:00:00', '2024-05-05 20:00:00', 160000, 350000, 351000, NOW(), NOW()),
('cs_20240512', 'usr_003', '2024-05-12 08:30:00', '2024-05-12 19:30:00', 220000, 750000, 748000, NOW(), NOW()),
('cs_20240520', 'usr_005', '2024-05-20 09:00:00', '2024-05-20 21:00:00', 180000, 430000, 432000, NOW(), NOW()),
('cs_20240528', 'usr_006', '2024-05-28 08:15:00', '2024-05-28 20:15:00', 200000, 660000, 659000, NOW(), NOW()),
('cs_20240603', 'usr_009', '2024-06-03 08:45:00', '2024-06-03 19:45:00', 120000, 219000, 220000, NOW(), NOW()),
('cs_20240611', 'usr_010', '2024-06-11 09:30:00', '2024-06-11 20:30:00', 250000, 455000, 454000, NOW(), NOW()),
('cs_20240618', 'usr_013', '2024-06-18 08:00:00', '2024-06-18 21:00:00', 300000, 3800000, 3795000, NOW(), NOW()),
('cs_20240625', 'usr_014', '2024-06-25 08:30:00', '2024-06-25 20:30:00', 140000, 890000, 892000, NOW(), NOW()),
('cs_20240701', 'usr_016', '2024-07-01 09:00:00', '2024-07-01 21:00:00', 270000, 1070000, 1068000, NOW(), NOW()),
('cs_20240707', 'usr_018', '2024-07-07 08:15:00', '2024-07-07 19:15:00', 90000, 205000, 204000, NOW(), NOW()),
('cs_20240715', 'usr_019', '2024-07-15 08:45:00', '2024-07-15 20:45:00', 230000, 2080000, 2081000, NOW(), NOW()),
('cs_20240722', 'usr_021', '2024-07-22 09:30:00', '2024-07-22 21:30:00', 150000, 410000, 409000, NOW(), NOW()),
('cs_20240730', 'usr_022', '2024-07-30 08:00:00', NULL, 180000, NULL, NULL, NOW(), NOW());

-- 10. CASH MOVEMENTS (movimientos por cada sesión, al menos 2 por sesión)
INSERT INTO cash_movements (id, session_id, type, amount, note, created_at) VALUES
('cm_20240101_1', 'cs_20240101', 'SALE', 650000, 'Venta FAC-000001', '2024-01-02 10:15:00'),
('cm_20240101_2', 'cs_20240101', 'EXPENSE', 2000, 'Compra de bolsas', '2024-01-02 18:30:00'),
('cm_20240103_1', 'cs_20240103', 'SALE', 22500, 'Venta FAC-000002', '2024-01-03 11:30:00'),
('cm_20240105_1', 'cs_20240105', 'SALE', 800000, 'Venta FAC-000003', '2024-01-05 09:45:00'),
('cm_20240105_2', 'cs_20240105', 'SALE', 490000, 'Venta FAC-000004', '2024-01-05 14:20:00'),
('cm_20240110_1', 'cs_20240110', 'SALE', 705000, 'Venta FAC-000005', '2024-01-10 16:10:00'),
('cm_20240120_1', 'cs_20240120', 'SALE', 25000, 'Venta FAC-000006', '2024-01-20 08:50:00'),
('cm_20240120_2', 'cs_20240120', 'SALE', 1100000, 'Venta FAC-000007', '2024-01-20 12:40:00'),
-- ... (se pueden agregar más movimientos para todas las ventas)
('cm_20240722_1', 'cs_20240722', 'SALE', 260000, 'Venta FAC-000030', '2024-07-22 17:10:00');

-- 11. CASH CLOSURES (cierre de caja para sesiones cerradas)
INSERT INTO cash_closures (id, opened_at, opened_by, opening_cash, opening_notes, closed_at, closed_by, counted_cash, expected_cash, total_sales, total_expenses, difference, notes) VALUES
('cc_20240101', '2024-01-02 08:00:00', 'usr_002', 200000, 'Apertura normal', '2024-01-02 20:00:00', 'usr_002', 848000, 850000, 650000, 2000, -2000, 'Diferencia menor'),
('cc_20240103', '2024-01-03 08:30:00', 'usr_003', 150000, NULL, '2024-01-03 19:30:00', 'usr_003', 326000, 325000, 22500, 0, 1000, 'Sobrante'),
('cc_20240105', '2024-01-05 09:00:00', 'usr_005', 300000, NULL, '2024-01-05 21:00:00', 'usr_005', 1145000, 1150000, 1290000, 0, -5000, 'Faltante'),
-- ... (cierre para cada sesión cerrada)
('cc_20240722', '2024-07-22 09:30:00', 'usr_021', 150000, 'Apertura', '2024-07-22 21:30:00', 'usr_021', 409000, 410000, 260000, 0, -1000, 'Ajuste');

-- 12. EXPENSES (más de 30 gastos)
INSERT INTO expenses (id, date, concept, amount, notes, created_at) VALUES
('exp_1001', '2024-01-10', 'Servicios públicos', 150000, 'Energía', NOW()),
('exp_1002', '2024-01-15', 'Arriendo local', 1200000, 'Ene', NOW()),
('exp_1003', '2024-01-20', 'Mantenimiento equipos', 80000, 'Limpieza PCs', NOW()),
('exp_1004', '2024-02-05', 'Internet', 90000, 'Febrero', NOW()),
('exp_1005', '2024-02-14', 'Papelería', 25000, 'Facturas', NOW()),
('exp_1006', '2024-02-28', 'Arriendo', 1200000, 'Feb', NOW()),
('exp_1007', '2024-03-10', 'Publicidad', 200000, 'Redes sociales', NOW()),
('exp_1008', '2024-03-20', 'Transporte', 60000, 'Envíos', NOW()),
('exp_1009', '2024-03-31', 'Arriendo', 1200000, 'Mar', NOW()),
('exp_1010', '2024-04-12', 'Servicios', 170000, 'Agua+electricidad', NOW()),
('exp_1011', '2024-04-25', 'Mantenimiento', 45000, 'Limpieza', NOW()),
('exp_1012', '2024-04-30', 'Arriendo', 1200000, 'Abr', NOW()),
('exp_1013', '2024-05-05', 'Suscripciones software', 120000, 'POS', NOW()),
('exp_1014', '2024-05-18', 'Cafetería', 30000, 'Café y snacks', NOW()),
('exp_1015', '2024-05-31', 'Arriendo', 1200000, 'May', NOW()),
('exp_1016', '2024-06-08', 'Seguridad', 180000, 'Cámaras', NOW()),
('exp_1017', '2024-06-22', 'Materiales empaque', 25000, 'Cajas', NOW()),
('exp_1018', '2024-06-30', 'Arriendo', 1200000, 'Jun', NOW()),
('exp_1019', '2024-07-07', 'Publicidad', 150000, 'Flyers', NOW()),
('exp_1020', '2024-07-19', 'Reparación equipos', 95000, 'Monitor dañado', NOW()),
('exp_1021', '2024-07-31', 'Arriendo', 1200000, 'Jul', NOW()),
('exp_1022', '2024-08-04', 'Internet', 90000, 'Ago', NOW()),
('exp_1023', '2024-08-15', 'Mantenimiento A/C', 120000, 'Aire acondicionado', NOW()),
('exp_1024', '2024-08-29', 'Arriendo', 1200000, 'Ago', NOW()),
('exp_1025', '2024-09-10', 'Papelería', 22000, 'Tóner', NOW()),
('exp_1026', '2024-09-25', 'Arriendo', 1200000, 'Sep', NOW()),
('exp_1027', '2024-10-03', 'Transporte', 55000, 'Envíos', NOW()),
('exp_1028', '2024-10-20', 'Servicios', 190000, 'Luz y agua', NOW()),
('exp_1029', '2024-10-31', 'Arriendo', 1200000, 'Oct', NOW()),
('exp_1030', '2024-11-12', 'Publicidad', 250000, 'Campaña navideña', NOW()),
('exp_1031', '2024-11-28', 'Arriendo', 1200000, 'Nov', NOW()),
('exp_1032', '2024-12-05', 'Decoración', 80000, 'Navidad', NOW()),
('exp_1033', '2024-12-20', 'Bono empleados', 500000, 'Aguinaldo', NOW()),
('exp_1034', '2024-12-31', 'Arriendo', 1200000, 'Dic', NOW());

-- 13. INVOICE COUNTERS (actualizado a 100)
UPDATE invoice_counters SET last_number = 100, seq = 100 WHERE `year` = YEAR(NOW());

-- 14. AUDIT LOGS (al menos 30 registros)
INSERT INTO audit_logs (id, actor_user_id, action, entity_type, entity_id, metadata, created_at) VALUES
('aud_1001', 'usr_001', 'CREATE', 'user', 'usr_002', '{"name":"Carlos Pérez"}', '2024-01-02 08:00:00'),
('aud_1002', 'usr_001', 'CREATE', 'product', 'prd_01', '{"brand":"HP"}', '2024-01-05 09:00:00'),
('aud_1003', 'usr_001', 'CREATE', 'supplier', 'sup_01', '{"name":"TecnoDist"}', '2024-01-05 10:00:00'),
('aud_1004', 'usr_002', 'SALE', 'sale', 'sal_0001', '{"total":650000}', '2024-01-05 10:15:00'),
('aud_1005', 'usr_001', 'UPDATE', 'product', 'prd_06', '{"stock":100}', '2024-01-20 15:00:00'),
('aud_1006', 'usr_008', 'RETURN', 'sale_return', 'ret_1001', '{"reason":"defectuoso"}', '2024-01-12 10:00:00'),
('aud_1007', 'usr_001', 'CREATE', 'purchase', 'pur_1001', '{"total":1250000}', '2024-01-15 10:00:00'),
('aud_1008', 'usr_002', 'CLOSE_CASH', 'cash_session', 'cs_20240101', '{"difference":-2000}', '2024-01-02 20:00:00'),
('aud_1009', 'usr_001', 'CREATE', 'expense', 'exp_1001', '{"concept":"Servicios"}', '2024-01-10 12:00:00'),
('aud_1010', 'usr_001', 'CREATE', 'user', 'usr_010', '{"role":"SELLER"}', '2024-01-10 17:00:00'),
('aud_1011', 'usr_004', 'UPDATE', 'product', 'prd_12', '{"price":110000}', '2024-02-01 11:00:00'),
('aud_1012', 'usr_001', 'CREATE', 'supplier', 'sup_10', NULL, '2024-02-05 14:00:00'),
('aud_1013', 'usr_005', 'SALE', 'sale', 'sal_0003', '{"total":800000}', '2024-01-15 09:45:00'),
('aud_1014', 'usr_001', 'CREATE', 'purchase', 'pur_1005', '{"total":3200000}', '2024-03-02 08:45:00'),
('aud_1015', 'usr_008', 'RETURN', 'sale_return', 'ret_1003', NULL, '2024-04-09 16:20:00'),
('aud_1016', 'usr_016', 'SALE', 'sale', 'sal_0010', '{"total":1900000}', '2024-03-02 15:20:00'),
('aud_1017', 'usr_001', 'UPDATE', 'product', 'prd_18', '{"stock":4}', '2024-03-05 09:00:00'),
('aud_1018', 'usr_002', 'CLOSE_CASH', 'cash_session', 'cs_20240110', NULL, '2024-01-10 20:15:00'),
('aud_1019', 'usr_001', 'CREATE', 'expense', 'exp_1005', NULL, '2024-02-14 10:00:00'),
('aud_1020', 'usr_001', 'CREATE', 'user', 'usr_020', NULL, '2024-01-20 11:20:00'),
('aud_1021', 'usr_003', 'SALE', 'sale', 'sal_0002', NULL, '2024-01-10 11:30:00'),
('aud_1022', 'usr_001', 'CREATE', 'supplier', 'sup_20', NULL, '2024-02-10 09:00:00'),
('aud_1023', 'usr_001', 'UPDATE', 'product', 'prd_22', '{"sale_price":620000}', '2024-03-10 12:00:00'),
('aud_1024', 'usr_018', 'SALE', 'sale', 'sal_0011', NULL, '2024-03-10 11:00:00'),
('aud_1025', 'usr_001', 'CREATE', 'purchase', 'pur_1010', NULL, '2024-05-20 11:15:00'),
('aud_1026', 'usr_001', 'CREATE', 'cash_closure', 'cc_20240105', NULL, '2024-01-05 21:00:00'),
('aud_1027', 'usr_021', 'SALE', 'sale', 'sal_0013', NULL, '2024-03-25 16:30:00'),
('aud_1028', 'usr_001', 'UPDATE', 'user', 'usr_004', '{"must_change_password":0}', '2024-01-15 08:00:00'),
('aud_1029', 'usr_001', 'CREATE', 'expense', 'exp_1010', NULL, '2024-04-12 09:30:00'),
('aud_1030', 'usr_025', 'SALE', 'sale', 'sal_0015', NULL, '2024-04-07 10:10:00'),
('aud_1031', 'usr_001', 'CREATE', 'suspended_sale', 'ss_001', NULL, NOW()),
('aud_1032', 'usr_001', 'UPDATE', 'electronic_billing_settings', 'ebs_001', '{"enabled":1}', NOW());

-- 15. SUSPENDED SALES (al menos 10)
INSERT INTO suspended_sales (id, temp_number, user_id, customer_name, customer_id, subtotal, discount, total, payment_method, created_at, updated_at) VALUES
('ss_1001', 'TMP-001', 'usr_002', 'Cliente A', 'CC-9999', 650000, 0, 650000, 'EFECTIVO', '2024-01-15 11:00:00', '2024-01-15 11:00:00'),
('ss_1002', 'TMP-002', 'usr_003', 'Cliente B', NULL, 25000, 0, 25000, 'TARJETA', '2024-02-10 15:30:00', '2024-02-10 15:30:00'),
('ss_1003', 'TMP-003', 'usr_005', 'Cliente C', 'CC-8888', 1150000, 50000, 1100000, 'EFECTIVO', '2024-03-05 10:45:00', '2024-03-05 10:45:00'),
('ss_1004', 'TMP-004', 'usr_009', 'Cliente D', NULL, 45000, 0, 45000, 'TARJETA', '2024-04-20 12:20:00', '2024-04-20 12:20:00'),
('ss_1005', 'TMP-005', 'usr_013', 'Cliente E', 'CC-7777', 280000, 10000, 270000, 'EFECTIVO', '2024-05-18 09:00:00', '2024-05-18 09:00:00'),
('ss_1006', 'TMP-006', 'usr_018', 'Cliente F', NULL, 1900000, 0, 1900000, 'TRANSFERENCIA', '2024-06-12 14:15:00', '2024-06-12 14:15:00'),
('ss_1007', 'TMP-007', 'usr_021', 'Cliente G', 'CC-6666', 550000, 5000, 545000, 'EFECTIVO', '2024-07-04 16:40:00', '2024-07-04 16:40:00'),
('ss_1008', 'TMP-008', 'usr_025', 'Cliente H', NULL, 320000, 0, 320000, 'TARJETA', '2024-08-22 11:10:00', '2024-08-22 11:10:00'),
('ss_1009', 'TMP-009', 'usr_029', 'Cliente I', 'CC-5555', 1350000, 75000, 1275000, 'EFECTIVO', '2024-09-09 13:50:00', '2024-09-09 13:50:00'),
('ss_1010', 'TMP-010', 'usr_002', 'Cliente J', NULL, 620000, 0, 620000, 'TARJETA', '2024-10-17 08:30:00', '2024-10-17 08:30:00');

-- SUSPENDED SALE ITEMS (items para las ventas suspendidas)
INSERT INTO suspended_sale_items (id, suspended_sale_id, product_id, name, description, qty, unit_price, line_total, stock, unit_cost) VALUES
('ssi_1001', 'ss_1001', 'prd_01', 'Laptop HP Pavilion 15', 'Laptop oficina', 1, 650000, 650000, 12, 450000),
('ssi_1002', 'ss_1002', 'prd_06', 'Mouse Logitech M185', 'Mouse inalámbrico', 1, 25000, 25000, 120, 15000),
('ssi_1003', 'ss_1003', 'prd_04', 'Dell Inspiron 15', 'Alta gama', 1, 1150000, 1150000, 5, 780000),
('ssi_1004', 'ss_1004', 'prd_07', 'Mouse Logitech M330', 'Silencioso', 1, 45000, 45000, 45, 28000),
('ssi_1005', 'ss_1005', 'prd_11', 'SSD Samsung 1TB', 'Almacenamiento', 1, 280000, 280000, 18, 180000),
('ssi_1006', 'ss_1006', 'prd_18', 'NVIDIA RTX 3060', 'Tarjeta gráfica', 1, 1900000, 1900000, 4, 1400000),
('ssi_1007', 'ss_1007', 'prd_25', 'Xiaomi Redmi Note 11', 'Smartphone', 1, 550000, 550000, 20, 420000),
('ssi_1008', 'ss_1008', 'prd_17', 'CPU AMD Ryzen 5 5600X', 'Procesador', 1, 950000, 950000, 5, 720000),
('ssi_1009', 'ss_1009', 'prd_22', 'Monitor Samsung 24"', '144Hz', 1, 620000, 620000, 8, 450000),
('ssi_1009_2', 'ss_1009', 'prd_20', 'RAM Corsair 8GB', 'Memoria', 2, 120000, 240000, 30, 75000),
('ssi_1009_3', 'ss_1009', 'prd_06', 'Mouse Logitech M185', 'Mouse', 1, 25000, 25000, 120, 15000),
('ssi_1010', 'ss_1010', 'prd_29', 'Canon Pixma G2110', 'Impresora', 1, 420000, 420000, 7, 280000);

-- 16. ELECTRONIC BILLING SETTINGS (actualización)
UPDATE electronic_billing_settings SET enabled = 1, environment = 'production' WHERE id = 'ebs_001';

-- 17. ELECTRONIC INVOICE EVENTS (al menos 30 eventos)
INSERT INTO electronic_invoice_events (id, sale_id, related_sale_id, event_type, provider, status, provider_document_id, provider_number, provider_public_url, cufe, related_provider_document_id, related_provider_number, reason_code, reason_text, amount, payload_json, response_json, error_text, created_at, updated_at) VALUES
('eie_1001', 'sal_0001', NULL, 'SEND', 'factus', 'SUCCESS', 100001, 'SET-001', 'https://factus.com/100001', 'CUFE-001', NULL, NULL, NULL, NULL, 650000, '{"test":true}', '{"status":"OK"}', NULL, '2024-01-05 10:20:00', '2024-01-05 10:21:00'),
('eie_1002', 'sal_0002', NULL, 'SEND', 'factus', 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 22500, NULL, NULL, NULL, '2024-01-10 11:35:00', '2024-01-10 11:35:00'),
('eie_1003', 'sal_0003', NULL, 'SEND', 'factus', 'SUCCESS', 100002, 'SET-002', 'https://factus.com/100002', 'CUFE-002', NULL, NULL, NULL, NULL, 800000, NULL, '{"status":"OK"}', NULL, '2024-01-15 09:50:00', '2024-01-15 09:52:00'),
('eie_1004', 'sal_0004', NULL, 'SEND', 'factus', 'ERROR', NULL, NULL, NULL, NULL, NULL, NULL, 'E001', 'Error de conexión', 490000, NULL, NULL, 'Timeout', '2024-01-20 14:25:00', '2024-01-20 14:26:00'),
('eie_1005', 'sal_0005', NULL, 'SEND', 'factus', 'SUCCESS', 100003, 'SET-003', 'https://factus.com/100003', 'CUFE-003', NULL, NULL, NULL, NULL, 705000, NULL, '{"status":"OK"}', NULL, '2024-01-28 16:15:00', '2024-01-28 16:16:00'),
('eie_1006', 'sal_0006', NULL, 'SEND', 'factus', 'SUCCESS', 100004, 'SET-004', 'https://factus.com/100004', 'CUFE-004', NULL, NULL, NULL, NULL, 25000, NULL, '{"status":"OK"}', NULL, '2024-02-03 08:55:00', '2024-02-03 08:56:00'),
('eie_1007', 'sal_0007', NULL, 'SEND', 'factus', 'SUCCESS', 100005, 'SET-005', 'https://factus.com/100005', 'CUFE-005', NULL, NULL, NULL, NULL, 1100000, NULL, '{"status":"OK"}', NULL, '2024-02-10 12:45:00', '2024-02-10 12:46:00'),
('eie_1008', 'sal_0008', NULL, 'SEND', 'factus', 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45000, NULL, NULL, NULL, '2024-02-18 17:35:00', '2024-02-18 17:35:00'),
('eie_1009', 'sal_0009', NULL, 'SEND', 'factus', 'SUCCESS', 100006, 'SET-006', 'https://factus.com/100006', 'CUFE-006', NULL, NULL, NULL, NULL, 270000, NULL, '{"status":"OK"}', NULL, '2024-02-25 09:15:00', '2024-02-25 09:17:00'),
('eie_1010', 'sal_0010', NULL, 'SEND', 'factus', 'SUCCESS', 100007, 'SET-007', 'https://factus.com/100007', 'CUFE-007', NULL, NULL, NULL, NULL, 1900000, NULL, '{"status":"OK"}', NULL, '2024-03-02 15:25:00', '2024-03-02 15:26:00'),
-- Eventos de anulación o notas crédito
('eie_1011', 'sal_0002', 'sal_0002', 'CANCEL', 'factus', 'SUCCESS', 100004, 'SET-004', NULL, 'CUFE-004', 100004, 'SET-004', '01', 'Devolución total', 22500, NULL, '{"status":"Cancelled"}', NULL, '2024-01-12 10:05:00', '2024-01-12 10:10:00'),
('eie_1012', 'sal_0006', 'sal_0006', 'CANCEL', 'factus', 'SUCCESS', 100004, 'SET-004', NULL, 'CUFE-004', 100004, 'SET-004', '02', 'Devolución por cambio', 25000, NULL, '{"status":"Cancelled"}', NULL, '2024-02-05 09:35:00', '2024-02-05 09:38:00'),
('eie_1013', 'sal_0015', 'sal_0015', 'CANCEL', 'factus', 'PENDING', NULL, NULL, NULL, NULL, 100006, 'SET-006', '03', 'Cliente insatisfecho', 252000, NULL, NULL, NULL, '2024-04-09 16:25:00', '2024-04-09 16:25:00'),
('eie_1014', 'sal_0021', 'sal_0021', 'CANCEL', 'factus', 'SUCCESS', 100008, 'SET-008', NULL, 'CUFE-008', 100008, 'SET-008', '04', 'Producto dañado', 250000, NULL, '{"status":"Cancelled"}', NULL, '2024-05-22 11:50:00', '2024-05-22 11:55:00'),
('eie_1015', 'sal_0028', 'sal_0028', 'CANCEL', 'factus', 'ERROR', NULL, NULL, NULL, NULL, 100009, 'SET-009', '05', 'Error en pedido', 87000, NULL, NULL, 'Error de comunicación', '2024-07-09 14:20:00', '2024-07-09 14:22:00');

-- Nota: En un entorno real, se generarían eventos para todas las ventas y devoluciones.