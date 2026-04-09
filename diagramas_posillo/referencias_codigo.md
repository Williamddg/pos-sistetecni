# Referencias de código usadas para construir los diagramas

## Arranque, licencia y rutas
- `app/renderer/src/App.tsx`: líneas 28-31 (autodetect), 73-75 (config negocio), 149-163 (SetupWizard / BusinessSetup / Login / ChangePassword / AppRoutes)
- `app/renderer/src/routes.tsx`: líneas 30-129 (rutas protegidas por licencia y permisos)
- `app/renderer/src/auth/RequireLicense.tsx`: líneas 26, 32, 59 (checkOnline, status, redirección a `/activate`)
- `app/electron/preload.ts`: líneas 29-34 (IPC de licencia)
- `app/electron/license/license.ts`: líneas 57, 98, 110, 150, 199, 208 (machineId, estado local, validación remota)

## Login
- `app/renderer/src/pages/Login.tsx`: líneas 43-50 (login y manejo de mustChangePassword)
- `app/renderer/src/services/auth.ts`
- `app/electron/ipc/auth.ipc.ts`: líneas 7-12 (canal `auth:login`)
- `app/electron/db/queries.ts`: línea 183 (`authUser` SQLite)
- `app/electron/db/mysql/auth.mysql.ts` (autenticación MySQL)

## Inventario / productos
- `app/renderer/src/pages/Inventory.tsx`: líneas 58, 142, 233, 306 (listar, guardar, archivar, actualizar)
- `app/renderer/src/services/products.ts`
- `app/electron/ipc/products.ipc.ts`: líneas 18-24, 29-40, 45-49, 74-81, 105-111
- `app/electron/db/products.repo.ts`: líneas 434-472 (repo dual SQLite/MySQL)

## POS, ventas, facturas y devoluciones
- `app/renderer/src/pages/POS.tsx`: líneas 101, 237, 328, 351, 385, 425, 441, 480, 579, 592, 1378, 1405
- `app/renderer/src/services/sales.ts`
- `app/electron/ipc/sales.ipc.ts`: líneas 35-60 (`sales:create`), 68 (`sales:print-invoice`), 120-203 (suspendidas/historial/detalle), 212-220 (`sales:return`)
- `app/electron/db/sales.repo.ts`: líneas 5-9
- `app/electron/db/queries.ts`: línea 346 (`createSale` SQLite), líneas 731-834 (suspendidas, historial, detalle)
- `app/electron/db/mysql/sales.mysql.ts`: línea 75 (`createSaleMySql`), líneas 392-463 (`returnSaleMySql`)
- `app/electron/invoice/invoicePdf.ts` (PDF físico de factura)

## Caja y efectivo
- `app/renderer/src/pages/Cash.tsx`: líneas 123-125 (estado de caja), 218 (cierre), 234 (comprobante), 276 (apertura)
- `app/electron/ipc/cash.ipc.ts`: líneas 14-77
- `app/electron/db/cash.repo.ts`: líneas 5-26
- `app/electron/db/queries.ts`: líneas 443 (`openCash`), 458 (`getCashStatus`), 479 (`closeCash`)

## Gastos
- `app/renderer/src/pages/Expenses.tsx`: líneas 58 y 160
- `app/electron/ipc/expenses.ipc.ts`: líneas 12-45
- `app/electron/db/expenses.repo.ts`: líneas 9-28
- `app/electron/db/queries.ts`: líneas 414 y 428

## Reportes y cierre diario
- `app/renderer/src/pages/Dashboard.tsx`
- `app/renderer/src/pages/Reports.tsx`: líneas 58-60
- `app/renderer/src/pages/DailyClose.tsx`: líneas 112, 148, 162
- `app/electron/ipc/reports.ipc.ts`: líneas 15-52
- `app/electron/db/reports.repo.ts`: líneas 25-59
- `app/electron/db/queries.ts`: línea 8 (`reportDailyClose`), 531 (`reportSalesByDay`), 534 (`reportTopProducts`), 554 (`reportSummary`)

## Usuarios y contraseñas
- `app/renderer/src/pages/Users.tsx`: líneas 30, 132, 174
- `app/renderer/src/pages/ChangePassword.tsx`
- `app/electron/ipc/users.ipc.ts`: líneas 40-162
- `app/electron/db/queries.ts`: líneas 229 (`createUser`), 249 (`resetUserPassword`), `changeUserPassword` arriba del bloque de roles

## Estructura de datos
- `app/electron/db/migrations.ts`: líneas 30-214 (tablas users, products, sales, sale_items, expenses, audit_logs, cash_closures, suspended_sales, sale_returns, suppliers, purchases)
- `docs/02-casos-de-uso.md`
- `docs/04-arquitectura.md`
