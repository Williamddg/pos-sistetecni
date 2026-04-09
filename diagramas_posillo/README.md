# Diagramas del sistema POS (basados en el código real)

Estos diagramas fueron generados a partir del proyecto `posillo-main-v2`.

## Cómo interpretar MVC + DAO en este proyecto

Este software **no usa un MVC clásico de una sola capa**. Usa una arquitectura de escritorio con Electron + React + TypeScript + SQLite/MySQL.

La equivalencia recomendada para documentarlo académicamente es:

- **Vista**: `app/renderer/src/pages/*.tsx`, `ui/*.tsx`, `routes.tsx`, `RequireLicense.tsx`
- **Controller**: `services/*.ts` + `preload.ts` + `ipc/*.ipc.ts`
- **Model**: `*.repo.ts`, lógica de negocio (`license.ts`, `invoicePdf.ts`, cálculos de caja/venta/reportes)
- **DAO**: `queries.ts` (SQLite) + `mysql/*.mysql.ts` (MySQL) + `db.ts` / `mysql.ts`

## Archivos incluidos

1. `00_arquitectura_general.svg` — arquitectura completa del sistema
2. `01_inicio_y_licencia.svg` — arranque, licencia y activación
3. `02_login.svg` — inicio de sesión
4. `03_consultar_inventario.svg` — consulta de inventario
5. `04_gestionar_producto.svg` — crear, editar, archivar producto
6. `05_buscar_producto_en_pos.svg` — búsqueda por texto/código de barras
7. `06_realizar_venta_y_generar_factura.svg` — venta + stock + PDF factura
8. `07_imprimir_factura_y_abrir_cajon.svg` — impresión y apertura de cajón
9. `08_suspender_reanudar_y_devolver_venta.svg` — suspendidas y devoluciones
10. `09_apertura_y_cierre_de_caja.svg` — caja y backup de cierre
11. `10_registrar_y_consultar_gastos.svg` — gastos
12. `11_reportes_y_cierre_diario.svg` — dashboard, reportes, cierre diario
13. `12_gestion_de_usuarios.svg` — usuarios y contraseñas

## Recomendación para la entrega

Para una entrega académica fuerte, usa:

- **1 diagrama general de arquitectura** (`00_arquitectura_general.svg`)
- **diagramas por proceso clave** (`02` a `12`)

Si el profesor pide “arquitectura del sistema”, el general suele ser suficiente.
Si pide “cómo funciona cada módulo”, agrega los diagramas por proceso.

## Hallazgos importantes del código

- La app arranca con `App.tsx`, autodetecta MySQL y luego valida licencia antes de entrar a rutas protegidas.
- El `preload.ts` expone toda la API por `window.api` y comunica el renderer con Electron main vía IPC.
- Los `ipc/*.ipc.ts` funcionan como controladores del backend local.
- Los `*.repo.ts` funcionan como capa de negocio/selección de backend.
- El DAO real está dividido entre SQLite (`queries.ts`) y MySQL (`mysql/*.mysql.ts`).
- La venta genera dos salidas de factura: **PDF físico en disco** y **HTML imprimible opcional**.
- La devolución de venta está implementada solo para MySQL.
- El cierre de caja crea además un backup automático.
