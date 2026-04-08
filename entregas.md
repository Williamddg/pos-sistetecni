# Mapeo de archivos por sprint

Este documento organiza los archivos del proyecto por sprint, usando:

- Archivos actuales que ya soportan HU del sprint.
- Archivos base de arranque (Sprint 1).
- Archivos adicionales propuestos para cubrir HU faltantes, repartidos de forma equilibrada entre Sprint 2 y Sprint 3.

---

## Sprint 1 (base + inventario + reportes de ventas)

### Frontend

- `app/renderer/index.html`
- `app/renderer/tsconfig.json`
- `app/renderer/vite.config.ts`
- `app/renderer/src/App.tsx`
- `app/renderer/src/main.tsx`
- `app/renderer/src/routes.tsx`
- `app/renderer/src/styles.css`
- `app/renderer/src/assets/logo.png`
- `app/renderer/src/auth/RequireLicense.tsx`
- `app/renderer/src/pages/Login.tsx`
- `app/renderer/src/pages/Activate.tsx`
- `app/renderer/src/pages/Dashboard.tsx`
- `app/renderer/src/pages/Inventory.tsx`
- `app/renderer/src/pages/Reports.tsx`
- `app/renderer/src/services/products.ts`
- `app/renderer/src/services/reports.ts`
- `app/renderer/src/services/session.ts`
- `app/renderer/src/services/auth.ts`
- `app/renderer/src/services/ipcClient.ts`
- `app/renderer/src/types/index.ts`
- `app/renderer/src/ui/Layout.tsx`
- `app/renderer/src/ui/Sidebar.tsx`
- `app/renderer/src/ui/Topbar.tsx`
- `app/renderer/src/ui/Button.tsx`
- `app/renderer/src/ui/Input.tsx`
- `app/renderer/src/ui/Modal.tsx`
- `app/renderer/src/ui/SplashScreen.tsx`
- `app/renderer/src/ui/LicenseAlert.tsx`
- `app/renderer/src/utils/dates.ts`
- `app/renderer/src/utils/money.ts`

### Backend

- `app/electron/main.ts`
- `app/electron/preload.ts`
- `app/electron/config/app.config.ts`
- `app/electron/license/license.ts`
- `app/electron/types/better-sqlite3.d.ts`
- `app/electron/db/db.ts`
- `app/electron/db/dbInstaller.ts`
- `app/electron/db/dbRouter.ts`
- `app/electron/db/migrations.ts`
- `app/electron/db/mysql.ts`
- `app/electron/db/mysqlClient.ts`
- `app/electron/db/mysqlConfig.ts`
- `app/electron/db/mysql.autodetect.ts`
- `app/electron/db/products.repo.ts`
- `app/electron/db/reports.repo.ts`
- `app/electron/db/queries.ts`
- `app/electron/db/mysql/helpers.ts`
- `app/electron/db/mysql/initSchema.mysql.ts`
- `app/electron/db/mysql/reports.mysql.ts`
- `app/electron/ipc/products.ipc.ts`
- `app/electron/ipc/reports.ipc.ts`
- `app/electron/ipc/auth.ipc.ts`
- `app/electron/ipc/autodetect.ipc.ts`
- `app/electron/ipc/mysql.ipc.ts`
- `app/electron/ipc/installer.ipc.ts`
- `app/electron/ipc/config.ipc.ts`
- `app/electron/ipc/rbac.ts`

---

## Sprint 2 (diagnóstico + reparaciones + registro de ventas)

### Frontend (existentes)

- `app/renderer/src/pages/POS.tsx`
- `app/renderer/src/invoice/invoiceTemplate.ts`
- `app/renderer/src/pages/Cash.tsx`
- `app/renderer/src/pages/Expenses.tsx`
- `app/renderer/src/services/sales.ts`
- `app/renderer/src/services/expenses.ts`
- `app/renderer/src/services/config.ts`
- `app/renderer/src/services/backups.ts`
- `app/renderer/src/reports/cashCloseTemplate.ts`
- `app/renderer/src/reports/dailyCloseTemplate.ts`

### Backend (existentes)

- `app/electron/invoice/invoicePdf.ts`
- `app/electron/db/sales.repo.ts`
- `app/electron/db/expenses.repo.ts`
- `app/electron/db/cash.repo.ts`
- `app/electron/db/mysql/sales.mysql.ts`
- `app/electron/db/mysql/cash.mysql.ts`
- `app/electron/db/mysql/expenses.mysql.ts`
- `app/electron/ipc/sales.ipc.ts`
- `app/electron/ipc/cash.ipc.ts`
- `app/electron/ipc/cashdrawer.ipc.ts`
- `app/electron/ipc/expenses.ipc.ts`
- `app/electron/ipc/backups.ipc.ts`

### Adicionales propuestos (mitad 1)

- `app/renderer/src/pages/Diagnostics.tsx`
- `app/renderer/src/pages/Repairs.tsx`
- `app/renderer/src/services/diagnostics.ts`
- `app/renderer/src/services/repairs.ts`
- `app/electron/db/diagnostics.repo.ts`
- `app/electron/db/repairs.repo.ts`
- `app/electron/ipc/diagnostics.ipc.ts`
- `app/electron/ipc/repairs.ipc.ts`

---

## Sprint 3 (historial de ventas + clientes + reporte de inventario + cierre funcional)

### Frontend (existentes)

- `app/renderer/src/pages/Users.tsx`
- `app/renderer/src/pages/Settings.tsx`
- `app/renderer/src/pages/BusinessSetup.tsx`
- `app/renderer/src/pages/BussinessSettings.tsx`
- `app/renderer/src/pages/SetupWizard.tsx`
- `app/renderer/src/pages/DailyClose.tsx`
- `app/renderer/src/pages/Audit.tsx`
- `app/renderer/src/pages/ChangePassword.tsx`
- `app/renderer/src/services/users.ts`
- `app/renderer/src/services/audit.ts`

### Backend (existentes)

- `app/electron/db/mysql/users.mysql.ts`
- `app/electron/db/audit.repo.ts`
- `app/electron/db/audit.types.ts`
- `app/electron/db/mysql/auth.mysql.ts`
- `app/electron/db/mysql/audit.mysql.ts`
- `app/electron/ipc/users.ipc.ts`
- `app/electron/ipc/audit.ipc.ts`

### Adicionales propuestos (mitad 2)

- `app/renderer/src/pages/Customers.tsx`
- `app/renderer/src/pages/CustomerHistory.tsx`
- `app/renderer/src/pages/InventoryReport.tsx`
- `app/renderer/src/services/customers.ts`
- `app/renderer/src/services/inventoryReports.ts`
- `app/electron/db/customers.repo.ts`
- `app/electron/db/inventoryReports.repo.ts`
- `app/electron/ipc/customers.ipc.ts`
- `app/electron/ipc/inventoryReports.ipc.ts`

---

## Resultado final (al cerrar los 3 sprints)

Con esta distribución:

- Sprint 1 cubre base técnica + inventario + reportes de ventas.
- Sprint 2 consolida operación de venta y agrega diagnóstico/reparación.
- Sprint 3 cierra gestión administrativa/comercial con clientes, historial por cliente y reporte de inventario.
