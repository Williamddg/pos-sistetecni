# Auditoría de Production Readiness — Sistetecni POS

Fecha: 2026-04-06

## A. Resumen ejecutivo

- **Score de readiness:** **42/100**
- **Veredicto:** **NO-GO**
- **Motivo corto:** El producto tiene base funcional, pero presenta bloqueantes de seguridad y operación (RBAC burlable desde renderer, credenciales por defecto expuestas/sembradas, secretos hardcodeados, controles IPC débiles, higiene de release y QA incompleta).

## B. Hallazgos críticos (priorizados)

| Severidad | Categoría | Archivos | Evidencia | Impacto real | Solución recomendada | ¿Bloquea? |
|---|---|---|---|---|---|---|
| **Crítica** | Seguridad / AuthZ | `app/electron/ipc/rbac.ts`, `app/renderer/src/services/session.ts` | El rol se toma del payload enviado por renderer (`payload.role`) para autorizar operaciones. | Un atacante con DevTools puede elevarse a `ADMIN` manipulando payload IPC. | Implementar sesión firmada en proceso main (token/nonce + lookup server-side) y derivar permisos del usuario autenticado real, no del payload. | **Sí** |
| **Crítica** | Seguridad / Credenciales | `README.md`, `database/seed.sql`, `app/electron/db/migrations.ts`, `app/electron/db/mysql/initSchema.mysql.ts`, `app/renderer/src/pages/Login.tsx` | Se documenta y siembra usuario admin default; login UI prellena email/password débiles. | Toma de control de instalaciones nuevas y riesgo alto en despliegues reales. | Forzar bootstrap seguro: contraseña aleatoria temporal + cambio obligatorio en primer login + wizard inicial sin credenciales públicas. | **Sí** |
| **Crítica** | Seguridad / Secretos | `app/electron/license/license.ts` | `SUPABASE_URL` y `SUPABASE_ANON_KEY` hardcodeados en código fuente. | Exposición de secretos operativos, abuso de endpoint de validación, riesgo de fraude/licenciamiento. | Mover a configuración segura externa, rotar claves y separar claves públicas/privadas adecuadamente. | **Sí** |
| **Alta** | Electron hardening | `app/electron/preload.ts` | API global amplia; listener genérico permitía suscribirse a canales arbitrarios sin allowlist estricta. | Superficie de ataque IPC ampliada, riesgo de abuso desde renderer comprometido. | Mantener allowlist cerrada y tipada por canal/evento, validación por schema en cada handler. | **Sí** |
| **Alta** | Integridad de datos | `app/electron/ipc/backups.ipc.ts` | Restore reemplaza DB en caliente sin control explícito de ciclo de vida del handle SQLite. | Riesgo de corrupción/locks, restore inconsistente. | Cerrar conexión antes de restaurar y reabrir/validar integridad después (aplicado en patch inicial). | **Sí** |
| **Alta** | Operabilidad / Build | `package.json`, raíz repo | No existe `.gitignore`; `node_modules/` quedó como untracked; scripts lint rotos con ESLint 9. | Releases sucios, CI inestable, riesgo de subir artefactos innecesarios. | Añadir `.gitignore`, fijar estrategia ESLint flat config o pin ESLint 8 con config actual. | **Sí** |
| **Alta** | Testing / Gate de calidad | `tests/rbac.test.ts`, `shared/permissions.ts` | Suite de tests falla en RBAC (expectativas no alineadas con permisos actuales). | Falta de confianza para release; regresiones de permisos pasan inadvertidas. | Corregir modelo de permisos y tests; bloquear release si hay tests fallidos. | **Sí** |
| **Media** | Arquitectura / deuda | `app/electron/db/queries.ts` y múltiples repos | Módulo monolítico de consultas con múltiples dominios mezclados y uso elevado de `any`. | Mantenimiento costoso, errores silenciosos, baja auditabilidad del dominio. | Separar por bounded contexts + DTOs tipados + validación runtime (zod/io-ts). | No (pero urgente) |
| **Media** | Seguridad / Logging | múltiples archivos `main.ts`, `mysql*.ts`, `sales.ipc.ts` | Logs de depuración extensivos en producción (modos, operaciones). | Filtración operativa/sensible y ruido para soporte. | Introducir logger con niveles por entorno y redacción de datos sensibles. | No |
| **Media** | Documentación | `database/schema.sql`, docs | Esquema SQL incompleto/placeholder y docs desfasadas del estado real. | Onboarding erróneo, instalaciones mal ejecutadas. | Generar esquema versionado real y documentación alineada a migraciones. | No |

## C. Hallazgos por área

### Seguridad
- RBAC confiado al renderer (bypass crítico).
- Secretos y credenciales default expuestos/hardcodeados.
- Falta de política de contraseñas robusta (longitud mínima 6 en cambio de contraseña).
- Persistencia de configuración sensible en JSON plano local sin cifrado.

### Arquitectura
- Responsabilidades mezcladas entre IPC, repos y queries legacy.
- Duplicidad SQLite/MySQL con comportamientos no uniformes.
- Demasiado `any` en fronteras críticas (IPC/DB).

### Base de datos
- Buena señal: `createSale` usa transacción para ventas SQLite.
- Riesgo: restore/backup sin pipeline de verificación (integrity check, checksum, rollback seguro).
- Seeds de admin fijo y sin expiración/rotación.
- `database/schema.sql` no representa el estado real.

### Electron
- Puntos fuertes: `contextIsolation=true`, `nodeIntegration=false` en ventana principal.
- Gap: falta estrategia de sesión segura main-side, validación fuerte de payload, y hardening uniforme en ventanas secundarias.

### Frontend
- Login con valores por defecto inseguros.
- Control de permisos UI existe, pero no es seguridad real sin validación main-side robusta.
- Manejo de errores en varios lugares devuelve mensajes genéricos o silenciosos.

### Build/Release
- Lint no ejecutable por incompatibilidad de configuración ESLint 9.
- Falta CI/CD versionado para gates de test/lint/build + seguridad (SCA).
- Empaquetado requiere admin (`requestedExecutionLevel=requireAdministrator`) sin matriz clara de justificación por operación.

### Testing
- Cobertura de dominio base existe (ventas/caja/productos/reportes/usuarios/auditoría).
- Ausentes: E2E, pruebas de seguridad IPC, pruebas de concurrencia y recuperación ante fallo.
- Suite RBAC fallando hoy.

### Operabilidad
- Sin métricas estructuradas, sin health diagnostics persistentes.
- Sin runbooks formales de restore/rollback/update por incidente.

### Escalabilidad
- Apto para escenario simple local (con riesgo), no apto aún para multi-caja robusto empresarial.
- Falta estrategia de sincronización/conflictos para offline prolongado y multi-sede.

## D. Código basura / limpieza

Identificados y removidos en esta intervención:
- `Nuevo Documento de texto.txt`
- `Nuevo Documento de texto (2).txt`
- `c.name`
- `c.name)`
- `users_old` (archivo suelto en raíz, distinto de tabla SQL)
- `{`

Otros candidatos:
- Revisar `manual_instalacion_sistetecni_pos_multicaja.txt` por contenido sensible/desactualizado antes de incluir en distribución.

## E. Must-have antes de producción

1. **Eliminar RBAC trust en payload y mover autorización al main con sesión verificable.**
2. **Eliminar credenciales por defecto públicas/hardcodeadas y forzar cambio inicial.**
3. **Rotar y externalizar secretos de licenciamiento.**
4. **Bloquear release con pipeline CI: test + lint + build + audit dependencia.**
5. **Validación estricta de payloads IPC (schemas) y reducción de superficie preload.**
6. **Plan formal de backup/restore con verificación de integridad y pruebas de desastre.**

## F. Recomendaciones para escalar

- Introducir capa de dominio + casos de uso (Hexagonal/Clean).
- Centralizar observabilidad (logs estructurados, incident IDs, nivel por entorno).
- Implementar estrategia de sync offline-first (event sourcing liviano o cola de cambios con reconciliación).
- Añadir pruebas E2E por flujos críticos: login, venta, cierre caja, devolución, restore.
- Versionar migraciones por motor con control explícito de drift.

## G. Patch plan priorizado

### P0 (bloqueante)
1. **AuthN/AuthZ hardening**
   - Archivos: `ipc/rbac.ts`, `ipc/auth.ipc.ts`, `preload.ts`, servicios de sesión renderer.
   - Cambio: sesión firmada en main + `ipcMain.handle` usando `event.senderFrame`/session map.
   - Riesgo: medio-alto (cambio transversal).

2. **Bootstrap seguro de credenciales**
   - Archivos: `migrations.ts`, `initSchema.mysql.ts`, `README.md`, `Login.tsx`.
   - Cambio: remover defaults públicos, generar credencial temporal + forced reset.
   - Riesgo: medio.

3. **Secrets management licencias**
   - Archivos: `license.ts`, pipeline build.
   - Cambio: inyección por entorno seguro, rotación de keys, invalidación de keys actuales.
   - Riesgo: alto operativo (coordinar backend/licencias).

### P1 (alta)
4. **Validación IPC por schema**
   - Archivos: todos `ipc/*.ts`.
   - Cambio: validar y normalizar payloads con zod.
   - Riesgo: medio.

5. **QA/CI gate de release**
   - Archivos: `package.json`, config eslint/jest, workflow CI.
   - Cambio: corregir lint y exigir passing checks.
   - Riesgo: bajo.

### P2 (media)
6. **Refactor deuda técnica DB/Repos**
   - Archivos: `db/queries.ts`, `db/*repo.ts`.
   - Cambio: separar por módulos de dominio y DTOs tipados.
   - Riesgo: medio.

## H. Cambios aplicados en esta auditoría

- Se crearon este informe (`PROD_AUDIT.md`) y el plan operativo (`PROD_FIX_PLAN.md`).
- Se aplicaron hardenings seguros de bajo riesgo:
  - Ventana principal Electron con `sandbox: true` y `webSecurity: true`.
  - Eliminación de loop de logging continuo de modo DB.
  - Preload con allowlist explícita para eventos y desuscripción puntual.
  - Restore de backups cerrando/reabriendo conexión SQLite para reducir riesgo de corrupción.
  - Limpieza de archivos basura de raíz.
  - Alta de `.gitignore` básico para higiene de repo.

### Riesgos remanentes tras patch
- RBAC aún vulnerable por diseño (trust en payload).
- Credenciales/secrets inseguros siguen presentes por impacto funcional transversal.
- Pipeline de calidad (lint/tests RBAC) aún requiere corrección estructural.
