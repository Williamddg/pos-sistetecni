# Entrega Documental — Sprint 1

**Proyecto:** Sistetecni POS Desktop/Offline  
**Iteración:** Sprint 1 (Incremento 1)  
**Fecha de corte documental:** 2026-04-06  
**Equipo:** Desarrollo POS (Electron + React + TypeScript + SQLite/MySQL)

---

## Tabla de contenido

- [3. Iteración 1 (Sprint backlog 1)](#3-iteración-1-sprint-backlog-1)
  - [3.2. Diseño arquitectónico inicial (patrón MVC)](#32-diseño-arquitectónico-inicial-patrón-mvc)
    - [3.2.1. Capa de lógica de negocio](#321-capa-de-lógica-de-negocio)
    - [3.2.2. Capa de presentación](#322-capa-de-presentación)
    - [3.2.3. Diagrama inicial de arquitectura del sistema (MVC + DAO)](#323-diagrama-inicial-de-arquitectura-del-sistema-mvc--dao)
    - [3.2.4. Capa de datos](#324-capa-de-datos)
  - [3.3. Elaboración - construcción](#33-elaboración---construcción)
    - [3.3.1. Creación de BD inicial (implementación y carga)](#331-creación-de-bd-inicial-implementación-y-carga)
    - [3.3.2. Construcción del código: incremento 1](#332-construcción-del-código-incremento-1)
    - [3.3.3. Diseño y aplicación de pruebas](#333-diseño-y-aplicación-de-pruebas)
  - [3.4. Sprint review](#34-sprint-review)
  - [3.5. Sprint retrospective](#35-sprint-retrospective)
  - [3.6. Product backlog actualizado](#36-product-backlog-actualizado)

---

## 3. Iteración 1 (Sprint backlog 1)

El Sprint 1 tuvo como objetivo construir un incremento funcional del POS desktop/offline, incluyendo autenticación básica, operación de venta, inventario, gastos, caja, reportes y respaldos, con ejecución local en Windows por Electron. El alcance funcional está alineado con los requerimientos y casos de uso base del repositorio.

> **Supuesto explícito:** donde la evidencia documental no detalla el flujo completo, se usa como fuente principal la estructura real del código y los módulos existentes en `app/electron` y `app/renderer`.

---

## 3.2. Diseño arquitectónico inicial (patrón MVC)

### 3.2.1. Capa de lógica de negocio

La capa de lógica de negocio se plantea con una separación MVC adaptada a Electron:

- **Controller (C):** handlers IPC en proceso main (`app/electron/ipc/*`), responsables de:
  - recibir peticiones del renderer,
  - validar permisos/autorización,
  - orquestar casos de uso,
  - devolver respuesta tipificada.
- **Model/Service (M):** repositorios y lógica transaccional (`app/electron/db/*.repo.ts`, `app/electron/db/queries.ts`, `app/electron/db/mysql/*.ts`), responsables de:
  - reglas de negocio (ventas, cierres, gastos, usuarios),
  - acceso SQLite/MySQL,
  - consistencia transaccional.
- **DAO:** implementación de persistencia por motor:
  - SQLite: `better-sqlite3` + queries parametrizadas,
  - MySQL: `mysql2` + capa de helpers/query.
- **View (V):** React renderer consume API expuesta por preload.

#### 3.2.1.1. Diseño de clases

A nivel de diseño conceptual (orientado a documentación, no necesariamente 1:1 con código actual), se definen las siguientes clases/componentes:

1. **AuthController**
2. **ProductsController**
3. **SalesController**
4. **CashController**
5. **ReportsController**
6. **UsersController**
7. **AuditController**
8. **BackupsController**
9. **ConfigController**
10. **LicenseController**
11. **SalesService**
12. **InventoryService**
13. **CashService**
14. **UserService**
15. **ReportService**
16. **AuditService**
17. **BackupService**
18. **RepositoryFactory (DAO selector por modo DB)**
19. **SQLite DAO (por entidad)**
20. **MySQL DAO (por entidad)**

#### 3.2.1.2. Descripción detallada de la clase

| Clase / Componente | Tipo | Responsabilidad principal | Entradas clave | Salidas clave |
|---|---|---|---|---|
| AuthController | Controller | Gestionar login y flujo de autenticación | email/password | usuario autenticado / error |
| SalesController | Controller | Crear ventas, suspender, consultar detalle, devolución | payload venta / id venta | id venta, factura, estado |
| CashController | Controller | Abrir/cerrar caja y estado operativo | apertura/cierre de caja | estado de caja, cierre calculado |
| ProductsController | Controller | Alta/edición/búsqueda/archivo de productos | datos de producto | id, listados, confirmación |
| UsersController | Controller | CRUD parcial de usuarios y contraseñas | datos de usuario | listados, id, estado |
| ReportsController | Controller | Exponer KPIs y reportes por período | rango fechas | agregados diarios/resumen/top |
| BackupsController | Controller | Crear/exportar/restaurar backups | acción + ruta/archivo | resultado de respaldo |
| SalesService | Service | Regla de venta, consistencia de stock e ítems | carrito + usuario + pago | transacción de venta |
| CashService | Service | Cálculo esperado/cierre | ventas+gastos+conteo | diferencia de caja |
| UserService | Service | Políticas de usuario y contraseñas | usuario/password | hash/validación |
| ReportService | Service | Consolidaciones y métricas | filtros fecha | datasets de reportes |
| RepositoryFactory | Infra/DAO | Enrutar a SQLite/MySQL según configuración | dbMode | instancia DAO |
| SQLite*DAO | DAO | Persistencia local offline | entidades de dominio | filas SQLite |
| MySQL*DAO | DAO | Persistencia remota/multicaja | entidades de dominio | filas MySQL |

#### 3.2.1.3. Diagrama de clases - inicial (descripción para dibujarlo)

**Propósito del diagrama**  
Representar responsabilidades por capas, dependencias y contratos entre controladores, servicios y DAOs.

**Elementos a incluir**

- Bloque **Controllers** (fila superior): AuthController, SalesController, CashController, ProductsController, UsersController, ReportsController, BackupsController, AuditController, ConfigController.
- Bloque **Services/Model** (fila media): AuthService, SalesService, CashService, InventoryService, UserService, ReportService, BackupService, AuditService.
- Bloque **DAO/Infra** (fila inferior): RepositoryFactory, SQLiteUserDAO, SQLiteProductDAO, SQLiteSalesDAO, SQLiteCashDAO, MySQLUserDAO, MySQLProductDAO, MySQLSalesDAO, MySQLCashDAO.
- Bloque **Entidades** (lateral derecho): User, Product, Sale, SaleItem, Expense, CashClosure, AuditLog.

**Relaciones y conexiones exactas**

- Cada `*Controller` **depende** de su `*Service` correspondiente (flecha unidireccional Controller → Service).
- Cada `*Service` **depende** de `RepositoryFactory` para resolver DAO (flecha Service → RepositoryFactory).
- `RepositoryFactory` **compone** una implementación concreta DAO según `dbMode` (rombo negro en RepositoryFactory hacia DAO concreto activo).
- Cada DAO **opera** sobre una o más entidades (flecha DAO → Entidad).
- `SalesService` se relaciona con `Sale`, `SaleItem`, `Product`.
- `CashService` se relaciona con `CashClosure`, `Sale`, `Expense`.
- `UserService` se relaciona con `User` y `AuditLog`.
- `ReportService` se relaciona con agregados de `Sale`, `SaleItem`, `Expense`, `CashClosure`.

**Jerarquías / abstracciones sugeridas**

- Interface `ISalesDAO`, `IUserDAO`, `IProductDAO`, etc.
- Implementaciones: `SQLiteSalesDAO` y `MySQLSalesDAO` implementan `ISalesDAO` (herencia de interfaz).

**Orientación visual recomendada**

- Disposición vertical por capas (Controllers arriba, Services centro, DAO abajo).
- Entidades al costado derecho, conectadas desde Service/DAO.
- Colores: azul (Controller), verde (Service), gris (DAO), naranja (Entidad).

**Notas para Draw.io/Lucidchart**

- Usar conectores sólidos para dependencia y conectores con rombo para composición.
- Etiquetar relaciones críticas con verbo: `orquesta`, `consulta`, `persiste`, `agrega`.

#### 3.2.1.4. Especificaciones y detalles de implementación

- **Lenguaje base:** TypeScript.
- **Frontera de seguridad:** `preload.ts` + `ipcMain.handle` en main.
- **Persistencia:** SQLite local (`better-sqlite3`) y fallback/configuración MySQL (`mysql2`).
- **Transaccionalidad:** implementada en operaciones críticas de venta/caja en capa de datos.
- **Auditoría:** existe módulo de auditoría con logs por acción, aún con brechas de robustez señaladas en auditoría.
- **Restricción actual importante:** la autorización por rol en IPC requiere endurecimiento adicional (hallazgo crítico documentado).

---

### 3.2.2. Capa de presentación

La capa de presentación está implementada en React + Vite y organizada por páginas funcionales. El enrutamiento contempla autorización por permisos y rutas por módulo operativo.

#### 3.2.2.1. Diseño de interfaces – (vistas)

Se documentan exclusivamente vistas existentes o inferibles de rutas/módulos actuales.

#### 3.2.2.1.1. Diseño de la vista

Criterios generales de diseño identificados:

- Estructura de navegación por layout principal (sidebar/topbar) para módulos de operación.
- Formularios por módulo (login, inventario, usuarios, caja, gastos).
- Tablas/listados para entidades transaccionales.
- Componentes compartidos (`Button`, `Input`, `Modal`, `Layout`, `Sidebar`, `Topbar`).

#### 3.2.2.1.2. Descripción detallada de cada vista (forma, contenido, uso)

> **Formato de placeholder visual:** `[[PENDIENTE_CAPTURA: nombre_vista.png]]`

##### Vista: Login
- **Objetivo:** autenticar usuario para habilitar acceso por rol.
- **Usuarios:** ADMIN, SUPERVISOR, SELLER.
- **Componentes esperados:** formulario email/password, mensaje de error, acción de ingreso.
- **Acciones principales:** iniciar sesión, gestionar error de credenciales.
- **Validaciones funcionales:** credenciales requeridas, rechazo de login inválido.
- **Navegación:** éxito → ruta principal según permisos.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: login.png]]`

##### Vista: Dashboard
- **Objetivo:** mostrar indicadores resumidos de operación.
- **Usuarios:** roles con permiso de reportes.
- **Componentes esperados:** tarjetas KPI, métricas diarias/semanales.
- **Acciones:** consulta de estado general.
- **Validaciones:** acceso restringido por permiso.
- **Navegación:** acceso a reportes, caja, ventas.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: dashboard.png]]`

##### Vista: POS
- **Objetivo:** ejecutar proceso de venta.
- **Usuarios:** SELLER, SUPERVISOR, ADMIN.
- **Componentes:** buscador de productos, carrito, totales, medio de pago, emisión de factura.
- **Acciones:** agregar ítems, confirmar venta, suspender venta, imprimir factura.
- **Validaciones:** stock disponible, cantidades válidas, cálculo de total.
- **Navegación:** detalle de venta / reportes / caja.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: pos.png]]`

##### Vista: Inventory
- **Objetivo:** administrar catálogo y stock.
- **Usuarios:** roles con permiso inventario.
- **Componentes:** tabla productos, formulario alta/edición, filtros.
- **Acciones:** crear, actualizar, archivar, buscar por texto/código.
- **Validaciones:** campos obligatorios, precios/stock numéricos.
- **Navegación:** POS, reportes.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: inventory.png]]`

##### Vista: Expenses
- **Objetivo:** registrar y consultar egresos.
- **Usuarios:** roles con permiso gastos.
- **Componentes:** formulario gasto, listado por fecha.
- **Acciones:** crear gasto, filtrar por rango.
- **Validaciones:** monto positivo, fecha y concepto obligatorios.
- **Navegación:** caja/reportes.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: expenses.png]]`

##### Vista: Cash
- **Objetivo:** apertura y cierre de caja.
- **Usuarios:** roles autorizados para caja.
- **Componentes:** estado de caja, formulario apertura/cierre, cálculo esperado.
- **Acciones:** abrir caja, consultar estado, cerrar caja.
- **Validaciones:** caja abierta única, conteo válido.
- **Navegación:** POS/reportes.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: cash.png]]`

##### Vista: Reports
- **Objetivo:** análisis de ventas, top productos y resumen operativo.
- **Usuarios:** roles con permiso reportes.
- **Componentes:** filtros por fecha, gráficos/tablas.
- **Acciones:** consultar indicadores y comparativas.
- **Validaciones:** rango de fechas coherente.
- **Navegación:** dashboard y módulos operativos.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: reports.png]]`

##### Vista: DailyClose
- **Objetivo:** consolidar cierre diario.
- **Usuarios:** supervisión/administración.
- **Componentes:** resumen de ventas, gastos, utilidad, medios de pago.
- **Acciones:** generar y revisar cierre diario.
- **Validaciones:** fecha válida, disponibilidad de datos.
- **Navegación:** reports/cash.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: daily-close.png]]`

##### Vista: Settings
- **Objetivo:** configuración de parámetros operativos.
- **Usuarios:** ADMIN (y/o roles con permiso de configuración).
- **Componentes:** formularios de configuración local, modos de BD, parámetros negocio.
- **Acciones:** modificar configuración y aplicar cambios.
- **Validaciones:** campos requeridos por modo.
- **Navegación:** setup/business settings.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: settings.png]]`

##### Vista: Users
- **Objetivo:** gestión de usuarios y contraseñas.
- **Usuarios:** ADMIN / roles autorizados.
- **Componentes:** listado usuarios, formulario creación/reset/cambio.
- **Acciones:** alta de usuario, reset contraseña, cambio contraseña.
- **Validaciones:** email único, rol válido, política de contraseña.
- **Navegación:** settings/audit.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: users.png]]`

##### Vista: Audit
- **Objetivo:** trazabilidad de acciones críticas.
- **Usuarios:** roles con permiso auditoría.
- **Componentes:** filtros por fecha/actor/acción, tabla de logs.
- **Acciones:** consulta de eventos auditables.
- **Validaciones:** filtros y límites de paginación.
- **Navegación:** reportes/settings.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: audit.png]]`

##### Vista: Activate
- **Objetivo:** activación/licenciamiento del software.
- **Usuarios:** administrador de instalación.
- **Componentes:** campo license key, estado de licencia.
- **Acciones:** activar licencia, verificar estado.
- **Validaciones:** clave requerida, estado online/offline.
- **Navegación:** login/flujo principal.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: activate.png]]`

##### Vista: SetupWizard / BusinessSetup / BusinessSettings / ChangePassword
- **Objetivo:** onboarding técnico, datos del negocio y seguridad de acceso.
- **Usuarios:** administrador y soporte técnico.
- **Componentes:** pasos de asistente, formularios de conexión/configuración y cambio de clave.
- **Acciones:** configurar modo de datos, datos empresa, actualizar contraseña.
- **Validaciones:** campos de conexión válidos, contraseña mínima.
- **Navegación:** settings/users/login.
- **Placeholder imagen:** `[[PENDIENTE_CAPTURA: setup-business-change-password.png]]`

---

### 3.2.3. Diagrama inicial de arquitectura del sistema (MVC + DAO)

**Propósito del diagrama**  
Visualizar componentes runtime y flujo de extremo a extremo desde UI hasta persistencia.

**Nodos obligatorios del diagrama**

1. **Usuario final (actor)**
2. **Renderer React (Views)**
3. **Preload API (puente seguro)**
4. **IPC Handlers (Controllers en main)**
5. **Servicios/Repos (Model/Business)**
6. **DAO Layer / RepositoryFactory**
7. **SQLite local**
8. **MySQL remoto (opcional/configurable)**
9. **Subsistemas transversales:** auditoría, backups, licencias, PDF/impresión.

**Conexiones exactas**

- Usuario final → Renderer (interacción UI).
- Renderer → Preload API (invocaciones autorizadas).
- Preload API → IPC Handlers (canales controlados).
- IPC Handlers → Servicios/Repos (orquestación de negocio).
- Servicios/Repos → DAO Layer (abstracción de persistencia).
- DAO Layer → SQLite o MySQL (según configuración).
- Servicios transversales:
  - SalesService → PDF/Impresión,
  - Controllers/Services → AuditService,
  - BackupsController → BackupService → almacenamiento local.

**Orientación sugerida**

- Izquierda a derecha por flujo: Actor → UI → Bridge → Controllers → Services → DAO → DB.
- Parte inferior para transversales conectados por líneas punteadas (auditoría, backup, licencia).

**Notas para dibujarlo**

- Representar “frontera de confianza” entre renderer y main.
- Marcar base offline (SQLite) como ruta principal y MySQL como ruta alternativa.
- Etiquetar con verbos: `invoca`, `valida`, `orquesta`, `persiste`, `audita`.

---

### 3.2.4. Capa de datos

#### 3.2.4.1. Determinación de entidades, atributos, llaves

Entidades principales identificadas en el estado real del proyecto:

| Entidad | PK | FK | Atributos principales | Restricciones observables |
|---|---|---|---|---|
| users | id | — | name, email, password_hash, role, created_at | email único, role con dominio de valores |
| products | id | — | brand, model, cpu, ram_gb, storage, purchase_price, sale_price, stock, active, created_at, updated_at | stock/precios numéricos, active default |
| sales | id | user_id -> users.id | invoice_number, date, payment_method, subtotal, discount, total, customer_name, created_at | invoice_number único |
| sale_items | id | sale_id -> sales.id, product_id -> products.id (nullable) | qty, unit_price, line_total, description, unit_cost | item ligado a venta, producto opcional para ítem libre |
| expenses | id | — | date, concept, amount, notes, created_at | amount entero positivo esperado |
| cash_closures | id | opened_by/closed_by (referencia lógica usuario) | opened_at, closed_at, opening_cash, counted_cash, expected_cash, total_sales, total_expenses, difference | una caja abierta activa por operación esperada |
| audit_logs | id | actor_user_id -> users.id | action, entity_type, entity_id, metadata, created_at | trazabilidad de acciones |
| suspended_sales | id | user_id -> users.id | temp_number, subtotal, total, payment_method, created_at, updated_at | soporte de ventas suspendidas |
| suspended_sale_items | id | suspended_sale_id -> suspended_sales.id | product_id, name, qty, unit_price, line_total | detalle de venta suspendida |
| sale_returns | id | sale_id -> sales.id, user_id -> users.id | reason, total_returned, created_at | devolución por venta |
| sale_return_items | id | return_id -> sale_returns.id | sale_item_id, product_id, qty, unit_price, line_total | detalle devolución |

> **Supuesto:** En MySQL algunas restricciones pueden implementarse de forma no idéntica a SQLite según scripts de inicialización/migración.

#### 3.2.4.2. Normalización (1NF, 2NF, 3NF)

Se resume la verificación de normalización para tablas principales:

| Tabla | 1NF | 2NF | 3NF | Observaciones |
|---|---|---|---|---|
| users | Cumple (atributos atómicos) | Cumple (PK simple `id`) | Cumple (sin dependencia transitiva relevante) | revisar política de seguridad de credenciales |
| products | Cumple | Cumple | Cumple en estructura base | posible futura separación de catálogos (marca/categoría) |
| sales | Cumple | Cumple | Parcialmente cumple (campos cliente denormalizados por practicidad POS) | aceptable para contexto transaccional offline |
| sale_items | Cumple | Cumple (PK simple) | Cumple si descripción/libre se mantiene como detalle de línea | correcto para histórico de venta |
| expenses | Cumple | Cumple | Cumple | puede agregarse catálogo de tipos de gasto en futuro |
| cash_closures | Cumple | Cumple | Cumple funcionalmente | mejorar restricciones y estados en DB |
| audit_logs | Cumple | Cumple | Cumple (metadata JSON/text flexible) | diseñar esquema auditable para compliance futuro |

Conclusión: el modelo principal es apto para operación Sprint 1; hay oportunidades de refactor para escalabilidad (catálogos, control de multi-sucursal, mayor consistencia entre motores).

#### 3.2.4.3. Diagrama modelo relacional – inicial (descripción para dibujarlo)

**Propósito del diagrama**  
Presentar estructura de persistencia, claves y cardinalidades de entidades transaccionales del POS.

**Entidades a dibujar (mínimo)**

- users
- products
- sales
- sale_items
- expenses
- cash_closures
- audit_logs
- suspended_sales
- suspended_sale_items
- sale_returns
- sale_return_items

**Relaciones cardinales exactas**

1. `users (1) ---- (N) sales` por `sales.user_id`.
2. `sales (1) ---- (N) sale_items` por `sale_items.sale_id`.
3. `products (1) ---- (N) sale_items` por `sale_items.product_id` (opcional/nullable en ítems libres).
4. `users (1) ---- (N) audit_logs` por `audit_logs.actor_user_id`.
5. `users (1) ---- (N) suspended_sales` por `suspended_sales.user_id`.
6. `suspended_sales (1) ---- (N) suspended_sale_items` por `suspended_sale_items.suspended_sale_id`.
7. `sales (1) ---- (N) sale_returns` por `sale_returns.sale_id`.
8. `sale_returns (1) ---- (N) sale_return_items` por `sale_return_items.return_id`.
9. `products (1) ---- (N) sale_return_items` por `sale_return_items.product_id` (nullable).

**Orientación visual sugerida**

- Centro: `sales` y `sale_items` (núcleo transaccional).
- Izquierda: `users`, `cash_closures`, `audit_logs`.
- Derecha: `products`.
- Inferior: `suspended_*` y `sale_returns*`.
- `expenses` como entidad independiente conectada lógicamente a reportes/caja.

**Notas para Draw.io/Lucidchart**

- Mostrar PK arriba y FK resaltadas en color distinto.
- Marcar nullable con sufijo `(NULL)` en atributo.
- Etiquetar índices relevantes (`invoice_number`, `barcode`, fechas).

---

## 3.3. Elaboración - construcción

### 3.3.1. Creación de BD inicial (implementación y carga)

#### 3.3.1.1. Script de creación BD, tablas

La creación de estructura se soporta mediante:

- migraciones runtime SQLite en capa Electron main,
- script de inicialización MySQL para instalación/configuración,
- SQL de referencia en carpeta `database/`.

**Tablas principales incluidas:** users, products, sales, sale_items, expenses, cash_closures, audit_logs, tablas de suspendidas y devoluciones.

**Observación de Sprint 1:** existe diferencia entre documentación SQL estática y estructura real efectiva por migraciones; se considera deuda técnica a normalizar en siguientes sprints.

#### 3.3.1.2. Carga de datos de prueba

- Existe semilla mínima de usuario inicial en lógica de migración.
- Tests unitarios crean datos controlados para usuarios, productos, ventas, gastos y caja.
- Para una entrega formal ampliada se recomienda:
  - dataset demo por módulo (mínimo 30 productos, 50 ventas históricas),
  - perfiles por rol (ADMIN/SUPERVISOR/SELLER),
  - cierres de caja y gastos de varios días.

#### 3.3.1.3. Generación del script de exportación con volcado/dump de datos

En el estado actual, el respaldo se gestiona desde la aplicación (backup/export/restore de SQLite). Para formalizar un “dump académico”:

- **SQLite:** copiar `.db` operativo y generar export SQL con herramienta sqlite3.
- **MySQL:** usar `mysqldump` con estructura + datos.

**Estandarización sugerida para anexo futuro:**

1. Script `scripts/export/sqlite_dump.bat`.
2. Script `scripts/export/mysql_dump.bat`.
3. Convención de nombre: `sistetecni-pos-YYYYMMDD-HHMM`.

---

### 3.3.2. Construcción del código: incremento 1

#### 3.3.2.1. Código Front-end (interfaces)

**Alcance esperado de esta sección:** evidenciar implementación de interfaces de usuario, navegación, formularios y validaciones visuales.

**Módulos/archivos que encajan en la sección:**

- `app/renderer/src/pages/*` (Login, Dashboard, POS, Inventory, Expenses, Cash, Reports, Settings, Users, Audit, Activate, DailyClose, Setup/BussinessSettings/BusinessSetup/ChangePassword).
- `app/renderer/src/routes.tsx` (rutas y guardas de permisos).
- `app/renderer/src/ui/*` (componentes base).
- `app/renderer/src/services/*` (consumo de API IPC).

**Evidencia de implementación existente:** el incremento tiene páginas por módulo, enrutamiento por permisos y servicios de integración con IPC.

**Contenido a anexar posteriormente:**

- capturas por vista,
- mapa de componentes por pantalla,
- fragmentos seleccionados de código UI (máximo 1–2 por módulo) con explicación.

#### 3.3.2.2. Código Back-end (lógica de negocio)

**Alcance esperado de esta sección:** evidenciar controladores, reglas de negocio, persistencia y procesos transaccionales.

**Módulos/archivos que encajan en la sección:**

- `app/electron/ipc/*` (controladores IPC por caso de uso).
- `app/electron/db/queries.ts` y `*.repo.ts` (servicios/reglas/repositorio).
- `app/electron/db/mysql/*` (adaptadores MySQL).
- `app/electron/main.ts`, `app/electron/preload.ts` (orquestación y puente).
- `app/electron/invoice/*`, `app/electron/license/*` (servicios transversales).

**Evidencia de implementación existente:** existe funcionalidad operativa en login, ventas, inventario, gastos, caja, reportes, backups y auditoría.

**Contenido a anexar posteriormente:**

- diagramas de secuencia por operación crítica (login, venta, cierre, restore),
- fragmentos de código de reglas de negocio,
- matriz de errores por módulo.

---

### 3.3.3. Diseño y aplicación de pruebas

#### Objetivo
Verificar funcionalidad crítica del incremento Sprint 1 y detectar riesgos de seguridad/estabilidad tempranos.

#### Alcance
- Autenticación y roles.
- Inventario y productos.
- Flujo de ventas y stock.
- Gastos y reportes.
- Caja (apertura/cierre).
- Auditoría.
- Backups/export/restore.

#### Casos principales (resumen)

| Caso | Precondición | Datos de prueba | Criterio de aceptación | Resultado esperado |
|---|---|---|---|---|
| Login válido/inválido | Usuario existente | credenciales correctas/incorrectas | acceso solo con credenciales válidas | éxito/fallo controlado |
| Crear/editar producto | Rol con permiso inventario | producto con precio/stock | persistencia correcta | registro actualizado |
| Venta con stock | Producto con stock > 0 | qty y pago válidos | descuenta stock y crea venta | venta confirmada |
| Venta sin stock | Producto sin stock suficiente | qty alta | bloqueo de operación | error de stock |
| Registrar gasto | Caja abierta/fecha válida | concepto+monto | gasto persistido | listado actualizado |
| Apertura/cierre caja | Usuario autorizado | apertura y conteo final | cálculo esperado y diferencia | cierre consistente |
| Reportes por fecha | Datos existentes | rango fechas | agregados correctos | tablas/gráficos consistentes |
| Backup/restore | BD operativa | acción backup/restaurar | operación concluye sin corrupción | respaldo usable |

#### Datos de prueba
- Usuarios por rol.
- Productos con distintos precios/stock.
- Ventas con efectivo y otros medios.
- Gastos diarios y cierres de caja consecutivos.

#### Criterios de aceptación generales
- No pérdida de datos en operaciones críticas.
- Validaciones funcionales activas.
- Restricciones de rol aplicadas en UI y backend.
- Trazabilidad de eventos auditables.

#### Observación de estado
La suite automatizada cubre módulos principales, pero existen ajustes pendientes en pruebas RBAC y calidad de pipeline antes de considerar readiness de producción.

---

## 3.4. Sprint review

### 3.4.1. Qué se construyó

- Base operativa de POS desktop/offline con Electron + React + TS.
- Módulos funcionales: login, POS, inventario, gastos, caja, reportes, backups y usuarios.
- Integración SQLite local y ruta alternativa MySQL.
- Soporte de factura PDF, impresión y auditoría básica.

### 3.4.2. Qué quedó operativo

- Flujo principal de venta con actualización de stock.
- Gestión básica de productos y gastos.
- Apertura/cierre de caja con cálculo de esperado.
- Reportes de ventas/resumen/top productos.
- Creación y exportación de backups.

### 3.4.3. Qué quedó parcial

- Endurecimiento completo de seguridad (RBAC main-side robusto).
- Formalización integral de CI/lint/release.
- Homologación documental del modelo de datos y scripts.
- Madurez multicaja/multisede y observabilidad operativa.

### 3.4.4. Qué se inspeccionó

- Inspección funcional del incremento por módulo.
- Revisión de arquitectura y seguridad (auditoría de readiness).
- Identificación de bloqueantes y plan de remediación priorizado.

### 3.4.5. Valor entregado por el incremento

- Permite operar un POS de alcance inicial en entorno local.
- Entrega base técnica reutilizable para sprints de hardening.
- Aporta trazabilidad y pruebas iniciales para evolución controlada.

---

## 3.5. Sprint retrospective

### 3.5.1. Qué salió bien

- Se completó un incremento funcional transversal del negocio POS.
- La arquitectura permite iterar por módulos relativamente desacoplados.
- La cobertura de pruebas funcionales base es un activo real del proyecto.

### 3.5.2. Qué salió mal

- Se acumuló deuda de seguridad crítica en autorización IPC.
- Documentación técnica quedó por detrás del estado real de implementación.
- Pipeline de calidad (lint/release) no quedó listo como gate formal.

### 3.5.3. Riesgos identificados

- Escalamiento de privilegios por diseño actual de RBAC en payload.
- Exposición de secretos y configuraciones sensibles.
- Riesgo operativo en restore, trazabilidad y soporte en campo.

### 3.5.4. Lecciones aprendidas

- En desktop híbrido, seguridad de IPC debe tratarse desde el inicio como requisito bloqueante.
- El cierre documental y de calidad debe avanzar en paralelo al desarrollo funcional.
- La dualidad SQLite/MySQL exige contratos técnicos uniformes y pruebas equivalentes.

### 3.5.5. Acciones de mejora para Sprint 2

1. Hardening de autenticación/autorización en proceso main.
2. Gestión segura de secretos y credenciales de arranque.
3. Formalización de CI con pruebas/lint/build obligatorios.
4. Estandarización de modelo y migraciones por motor.

---

## 3.6. Product backlog actualizado

| ID | Ítem / Historia | Prioridad | Estado | Observaciones |
|---|---|---|---|---|
| PB-001 | Como administrador, quiero autenticación robusta main-side para evitar elevación de privilegios | Alta (seguridad) | Pendiente | Bloqueante auditoría |
| PB-002 | Como operador, quiero credenciales iniciales seguras con cambio obligatorio | Alta (seguridad) | Pendiente | Relacionado a bootstrap de usuarios |
| PB-003 | Como equipo, quiero externalizar secretos/licencias | Alta (seguridad) | Pendiente | Requiere coordinación con backend licencias |
| PB-004 | Como QA, quiero pipeline CI con lint+test+build | Alta (estabilidad) | Pendiente | Gate de release |
| PB-005 | Como soporte, quiero restore con verificación de integridad | Alta (estabilidad) | Parcial | base implementada, falta checksum/integrity-check |
| PB-006 | Como desarrollador, quiero validación de payloads IPC por schema | Media (calidad) | Pendiente | reduce errores y abuso |
| PB-007 | Como arquitecto, quiero modularizar `queries.ts` por dominio | Media (calidad) | Pendiente | deuda técnica estructural |
| PB-008 | Como gerente, quiero observabilidad/logs estructurados por nivel | Media (operación) | Pendiente | mejora troubleshooting |
| PB-009 | Como negocio, quiero estrategia real multi-caja/multi-sede | Media (escalabilidad) | Pendiente | depende de diseño sync |
| PB-010 | Como equipo, quiero documentación técnica sincronizada con código | Media (calidad) | En progreso | este documento cubre parte del gap |

**Clasificación de backlog por obligatoriedad**

- **Obligatorio para seguridad:** PB-001, PB-002, PB-003.
- **Obligatorio para estabilidad:** PB-004, PB-005.
- **Recomendable para calidad:** PB-006, PB-007, PB-010.
- **Recomendable para escalabilidad:** PB-008, PB-009.

---

### Cierre del documento

La presente entrega de Sprint 1 documenta diseño, construcción, pruebas e inspección del incremento implementado, dejando trazado un backlog técnico coherente con la auditoría de readiness y con la continuidad planificada para Sprint 2 y Sprint 3.
