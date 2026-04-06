# PROD_FIX_PLAN — Plan de remediación priorizado

## Objetivo
Cerrar bloqueantes de seguridad y operación para habilitar release productivo confiable.

## Horizonte 0-7 días (P0)

### 1) Blindaje AuthZ en IPC
- **Acción:** dejar de autorizar por `payload.role`.
- **Implementación:**
  1. En `auth:login` generar `sessionId` aleatorio en main.
  2. Guardar sesión en mapa in-memory (`sessionId -> {userId, role, issuedAt}`).
  3. En cada IPC privilegiado exigir `sessionId` y resolver rol desde mapa.
  4. Rechazar requests sin sesión válida o expirada.
- **Archivos iniciales:** `app/electron/ipc/auth.ipc.ts`, `app/electron/ipc/rbac.ts`, `app/electron/preload.ts`, `app/renderer/src/services/session.ts`.
- **Criterio de salida:** pruebas de bypass por payload falsificado deben fallar.

### 2) Credenciales iniciales seguras
- **Acción:** remover admin/password públicos de código y docs.
- **Implementación:**
  1. Seed inicial con contraseña temporal aleatoria.
  2. Flag `must_change_password=1` en primer acceso.
  3. Mostrar flujo obligatorio de cambio al primer login.
- **Archivos:** `app/electron/db/migrations.ts`, `app/electron/db/mysql/initSchema.mysql.ts`, `README.md`, `database/seed.sql`, `app/renderer/src/pages/Login.tsx`.

### 3) Secretos/licenciamiento
- **Acción:** externalizar y rotar claves.
- **Implementación:**
  1. Eliminar fallback hardcode en `license.ts`.
  2. Proveer config por entorno (build-time) y mecanismo de validación de presencia.
  3. Rotación de clave actual y revocación de uso no autorizado.
- **Archivos:** `app/electron/license/license.ts`, pipeline de build.

## Horizonte 1-3 semanas (P1)

### 4) Validación de payloads IPC
- Adoptar schemas `zod` por canal (`products`, `sales`, `cash`, `users`, `reports`, `backup`).
- Rechazar payload inválido con códigos de error estables.

### 5) Pipeline de calidad
- Corregir lint para ESLint 9 (flat config) o pin temporal ESLint 8.
- Agregar CI mínimo: `npm ci`, `npm run lint`, `npm test`, `npm run build`.
- Bloquear merge/release con checks fallidos.

### 6) Backup/restore profesional
- Validar checksum del backup.
- Correr `PRAGMA integrity_check` tras restore.
- Crear restore transaccional con snapshot previo automático.
- Documentar runbook de recuperación.

## Horizonte 1-2 meses (P2)

### 7) Refactor de capa de datos
- Dividir `queries.ts` en módulos de dominio (`sales`, `cash`, `users`, `inventory`, `audit`).
- Reemplazar `any` por DTOs tipados.
- Unificar contratos SQLite/MySQL.

### 8) Escalabilidad multi-caja/multi-sede
- Definir estrategia de sincronización offline (cola de eventos, idempotencia, reconciliación de conflictos).
- Agregar identificadores de caja/sucursal en tablas transaccionales.
- Diseñar auditoría de cambios sincronizados.

## Métricas de cierre sugeridas
- 0 hallazgos críticos abiertos.
- 100% tests de seguridad RBAC/IPC verdes.
- 0 secretos hardcodeados detectados por escaneo.
- Restore exitoso probado en simulación de incidente.
