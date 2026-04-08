Voy a revisar la estructura del repositorio para identificar con precisión qué carpetas y archivos pertenecen al frontend y cuáles al backend, y luego te dejo dos listados claros.

[3 tools called]

Ya ubiqué la estructura principal; ahora voy a validar con `package.json` cómo está dividida la app (renderer/main) para darte una clasificación exacta de frontend y backend.

[4 tools called]

Estas son las rutas que corresponden **específicamente** en tu proyecto:

## Frontend (UI / React / Renderer)

**Carpeta raíz:** `app/renderer/`

### Carpetas frontend
- `app/renderer/src/`
- `app/renderer/src/assets/`
- `app/renderer/src/auth/`
- `app/renderer/src/invoice/`
- `app/renderer/src/pages/`
- `app/renderer/src/reports/`
- `app/renderer/src/services/`
- `app/renderer/src/types/`
- `app/renderer/src/ui/`
- `app/renderer/src/utils/`

### Archivos frontend
- `app/renderer/index.html`
- `app/renderer/tsconfig.json`
- `app/renderer/vite.config.ts`
- `app/renderer/src/App.tsx`
- `app/renderer/src/main.tsx`
- `app/renderer/src/routes.tsx`
- `app/renderer/src/styles.css`
- `app/renderer/src/assets/logo.png`
- `app/renderer/src/auth/RequireLicense.tsx`
- `app/renderer/src/invoice/invoiceTemplate.ts`
- `app/renderer/src/reports/cashCloseTemplate.ts`
- `app/renderer/src/reports/dailyCloseTemplate.ts`
- `app/renderer/src/pages/Activate.tsx`
- `app/renderer/src/pages/Audit.tsx`
- `app/renderer/src/pages/BusinessSetup.tsx`
- `app/renderer/src/pages/BussinessSettings.tsx`
- `app/renderer/src/pages/Cash.tsx`
- `app/renderer/src/pages/ChangePassword.tsx`
- `app/renderer/src/pages/DailyClose.tsx`
- `app/renderer/src/pages/Dashboard.tsx`
- `app/renderer/src/pages/Expenses.tsx`
- `app/renderer/src/pages/Inventory.tsx`
- `app/renderer/src/pages/Login.tsx`
- `app/renderer/src/pages/POS.tsx`
- `app/renderer/src/pages/Reports.tsx`
- `app/renderer/src/pages/Settings.tsx`
- `app/renderer/src/pages/SetupWizard.tsx`
- `app/renderer/src/pages/Users.tsx`
- `app/renderer/src/services/audit.ts`
- `app/renderer/src/services/auth.ts`
- `app/renderer/src/services/backups.ts`
- `app/renderer/src/services/config.ts`
- `app/renderer/src/services/expenses.ts`
- `app/renderer/src/services/ipcClient.ts`
- `app/renderer/src/services/products.ts`
- `app/renderer/src/services/reports.ts`
- `app/renderer/src/services/sales.ts`
- `app/renderer/src/services/session.ts`
- `app/renderer/src/services/users.ts`
- `app/renderer/src/types/index.ts`
- `app/renderer/src/ui/Button.tsx`
- `app/renderer/src/ui/Input.tsx`
- `app/renderer/src/ui/Layout.tsx`
- `app/renderer/src/ui/LicenseAlert.tsx`
- `app/renderer/src/ui/Modal.tsx`
- `app/renderer/src/ui/Sidebar.tsx`
- `app/renderer/src/ui/SplashScreen.tsx`
- `app/renderer/src/ui/Topbar.tsx`
- `app/renderer/src/utils/dates.ts`
- `app/renderer/src/utils/money.ts`

---

## Backend (Electron main process / IPC / DB)

**Carpeta raíz:** `app/electron/`

### Carpetas backend
- `app/electron/config/`
- `app/electron/db/`
- `app/electron/db/mysql/`
- `app/electron/invoice/`
- `app/electron/ipc/`
- `app/electron/license/`
- `app/electron/types/`

### Archivos backend
- `app/electron/main.ts`
- `app/electron/preload.ts`
- `app/electron/config/app.config.ts`
- `app/electron/invoice/invoicePdf.ts`
- `app/electron/license/license.ts`
- `app/electron/types/better-sqlite3.d.ts`
- `app/electron/db/audit.repo.ts`
- `app/electron/db/audit.types.ts`
- `app/electron/db/cash.repo.ts`
- `app/electron/db/db.ts`
- `app/electron/db/dbInstaller.ts`
- `app/electron/db/dbRouter.ts`
- `app/electron/db/expenses.repo.ts`
- `app/electron/db/migrations.ts`
- `app/electron/db/mysql.autodetect.ts`
- `app/electron/db/mysql.ts`
- `app/electron/db/mysqlClient.ts`
- `app/electron/db/mysqlConfig.ts`
- `app/electron/db/products.repo.ts`
- `app/electron/db/queries.ts`
- `app/electron/db/reports.repo.ts`
- `app/electron/db/sales.repo.ts`
- `app/electron/db/mysql/audit.mysql.ts`
- `app/electron/db/mysql/auth.mysql.ts`
- `app/electron/db/mysql/cash.mysql.ts`
- `app/electron/db/mysql/expenses.mysql.ts`
- `app/electron/db/mysql/helpers.ts`
- `app/electron/db/mysql/initSchema.mysql.ts`
- `app/electron/db/mysql/reports.mysql.ts`
- `app/electron/db/mysql/sales.mysql.ts`
- `app/electron/db/mysql/users.mysql.ts`
- `app/electron/ipc/audit.ipc.ts`
- `app/electron/ipc/auth.ipc.ts`
- `app/electron/ipc/autodetect.ipc.ts`
- `app/electron/ipc/backups.ipc.ts`
- `app/electron/ipc/cash.ipc.ts`
- `app/electron/ipc/cashdrawer.ipc.ts`
- `app/electron/ipc/config.ipc.ts`
- `app/electron/ipc/expenses.ipc.ts`
- `app/electron/ipc/installer.ipc.ts`
- `app/electron/ipc/mysql.ipc.ts`
- `app/electron/ipc/products.ipc.ts`
- `app/electron/ipc/rbac.ts`
- `app/electron/ipc/reports.ipc.ts`
- `app/electron/ipc/sales.ipc.ts`
- `app/electron/ipc/users.ipc.ts`

---

Si quieres, en el siguiente paso te separo también los archivos de **raíz del repo** (`package.json`, `tsconfig*`, `tests/`, `database/`, etc.) en: “solo backend”, “solo frontend” y “compartidos/devops”.