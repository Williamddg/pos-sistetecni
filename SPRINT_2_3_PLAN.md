# Plan de Continuidad — Sprint 2 y Sprint 3

## 1. Objetivo del documento

Definir una planificación técnica y realista para los siguientes dos sprints, utilizando como insumo principal la auditoría de producción (`PROD_AUDIT.md`) y el plan de remediación (`PROD_FIX_PLAN.md`), con distribución equilibrada de trabajo por prioridad, dependencias, riesgo e impacto.

---

## 2. Criterios usados para repartir el trabajo

Se aplicaron los siguientes criterios de distribución:

1. **Riesgo primero:** los bloqueantes de seguridad y estabilidad se atienden de forma temprana.
2. **Dependencias técnicas:** tareas fundacionales (AuthZ seguro, CI, validación IPC) preceden refactors profundos.
3. **Balance de esfuerzo:** no concentrar todo el trabajo crítico en un único sprint.
4. **Impacto de negocio:** priorizar continuidad operativa del POS (ventas, caja, respaldo).
5. **Trazabilidad de auditoría:** cada ítem mapea a hallazgos explícitos de Sprint 1.
6. **Realismo temporal:** sprints con alcance ejecutable por equipo pequeño/mediano.

---

## 3. Resumen de hallazgos heredados del Sprint 1

### 3.1 Hallazgos obligatorios para seguridad
- RBAC vulnerable por confianza en `payload.role` del renderer.
- Credenciales iniciales inseguras y/o semilla predecible.
- Secretos de licenciamiento hardcodeados.

### 3.2 Hallazgos obligatorios para estabilidad
- Falta de gate de calidad integral (lint/test/build en CI).
- Restore/backup requiere verificación adicional (integridad/checksum/runbook).
- Inconsistencias de documentación técnica respecto a implementación real.

### 3.3 Hallazgos recomendables para calidad
- Uso alto de `any` y módulo de consultas sobredimensionado.
- Validación de payloads IPC no homogénea por schemas.
- Logging poco estructurado para operación y soporte.

### 3.4 Hallazgos recomendables para escalabilidad
- Estrategia multi-caja/multi-sede incompleta.
- Contratos SQLite/MySQL no totalmente uniformes.
- Falta diseño de sincronización offline prolongada.

---

## 4. Sprint 2

### 4.1 Objetivo del sprint

Eliminar bloqueantes críticos de seguridad/estabilidad y dejar una base de release controlada para continuidad del producto.

### 4.2 Alcance

Sprint centrado en **hardening inmediato** sin intentar refactor total de arquitectura.

### 4.3 Ítems / historias / tareas

| ID | Tipo | Ítem | Clasificación | Justificación |
|---|---|---|---|---|
| S2-01 | Historia | Implementar sesión autenticada main-side y autorización sin confiar en payload de renderer | Obligatorio seguridad | Cierra bypass crítico de privilegios |
| S2-02 | Tarea técnica | Diseñar `sessionId`/expiración y invalidación de sesión | Obligatorio seguridad | Completa robustez del S2-01 |
| S2-03 | Historia | Eliminar credenciales iniciales predecibles y forzar cambio de contraseña inicial | Obligatorio seguridad | Reduce riesgo de toma de control |
| S2-04 | Tarea técnica | Externalizar secretos de licencia y eliminar fallback hardcode | Obligatorio seguridad | Evita exposición en cliente |
| S2-05 | Historia | Habilitar pipeline CI mínimo (lint+test+build) con gate de merge | Obligatorio estabilidad | Evita regresiones silenciosas |
| S2-06 | Tarea técnica | Corregir configuración ESLint (flat config o pin controlado) | Obligatorio estabilidad | Desbloquea S2-05 |
| S2-07 | Historia | Endurecer backup/restore con `integrity_check` y snapshot previo | Obligatorio estabilidad | Mitiga pérdida/corrupción de datos |
| S2-08 | Tarea técnica | Plan de pruebas smoke de release (login, venta, caja, backup) | Recomendable calidad | Validación rápida pre-entrega |

### 4.4 Justificación del alcance

- Sprint 2 prioriza eliminar los riesgos que **impiden un GO** técnico.
- Se limita el refactor estructural para no comprometer plazo ni estabilidad del incremento ya operativo.

### 4.5 Dependencias internas

- S2-01 depende de definición de contrato sesión en preload/renderer.
- S2-05 depende de S2-06 para estabilizar lint.
- S2-07 depende de estandarizar flujo de restore en capa de datos.

### 4.6 Entregables esperados

1. Mecanismo de autorización main-side operativo con pruebas de bypass negativas.
2. Bootstrap seguro de usuarios (sin credenciales públicas).
3. Secrets management básico operacional para licencia.
4. Workflow CI ejecutable y obligatorio.
5. Procedimiento de restore con chequeo de integridad.
6. Checklist smoke de release.

### 4.7 Riesgos del sprint

| Riesgo | Probabilidad | Impacto | Mitigación |
|---|---|---|---|
| Cambios de sesión rompen llamadas IPC existentes | Media | Alta | rollout por feature flag + pruebas de regresión |
| Coordinación de claves/licencias retrasa entrega | Alta | Media | definir ventana de rotación y fallback controlado |
| Ajuste de lint genera alto volumen de cambios | Media | Media | separar reglas bloqueantes vs advertencias |

### 4.8 Criterios de terminado (Definition of Done)

- 100% de historias S2 obligatorias cerradas.
- Tests de seguridad RBAC/IPC en verde.
- Pipeline CI bloquea merge con fallo.
- Procedimiento de backup/restore validado en prueba controlada.

---

## 5. Sprint 3

### 5.1 Objetivo del sprint

Consolidar mantenibilidad y preparar escalamiento operacional (multi-caja, calidad sostenida, arquitectura más modular).

### 5.2 Alcance

Sprint orientado a **calidad estructural + escalabilidad gradual**, sobre la base estabilizada en Sprint 2.

### 5.3 Ítems / historias / tareas

| ID | Tipo | Ítem | Clasificación | Justificación |
|---|---|---|---|---|
| S3-01 | Historia | Validación de payloads IPC por schemas (zod o equivalente) | Recomendable calidad | robustez en frontera de entrada |
| S3-02 | Historia | Refactor modular de `queries.ts` por dominios | Recomendable calidad | reduce deuda técnica y acoplamiento |
| S3-03 | Tarea técnica | Reducir `any` en capas críticas (IPC, servicios, repos) | Recomendable calidad | mejora mantenibilidad y seguridad de tipos |
| S3-04 | Historia | Estandarizar contratos SQLite/MySQL y pruebas equivalentes | Recomendable escalabilidad | evita divergencias por motor |
| S3-05 | Historia | Introducir logging estructurado por niveles y contexto | Recomendable calidad/operación | mejora soporte y diagnóstico |
| S3-06 | Historia | Diseñar estrategia de operación multi-caja/multi-sede (fase 1) | Recomendable escalabilidad | base para crecimiento futuro |
| S3-07 | Tarea técnica | Definir ADRs técnicos (seguridad IPC, persistencia, sync) | Recomendable calidad | decisiones arquitectónicas trazables |
| S3-08 | Historia | Actualizar documentación técnica oficial post-hardening | Recomendable calidad | cierre documental alineado a código |

### 5.4 Justificación del alcance

- Sprint 3 aprovecha la estabilización de Sprint 2 para atacar deuda estructural sin comprometer seguridad base.
- Se incorpora escalabilidad de forma incremental (diseño y habilitadores), evitando sobreingeniería.

### 5.5 Dependencias internas

- S3-02 y S3-03 dependen de estabilidad funcional lograda en Sprint 2.
- S3-04 depende de contratos definidos en S3-01/S3-02.
- S3-06 depende de análisis de operación y restricciones del negocio.

### 5.6 Entregables esperados

1. Contratos de entrada IPC validados por schema.
2. Módulos de datos desacoplados por dominio.
3. Mejora de tipado en flujos críticos.
4. Matriz de paridad SQLite/MySQL.
5. Sistema de logging estructurado.
6. Documento de diseño multi-caja/multi-sede fase 1.
7. Documentación técnica actualizada.

### 5.7 Riesgos del sprint

| Riesgo | Probabilidad | Impacto | Mitigación |
|---|---|---|---|
| Refactor modular introduce regresiones funcionales | Media | Alta | pruebas de regresión por módulo + PRs pequeños |
| Alcance de multi-sede se expande excesivamente | Media | Media | limitar a fase de diseño y prototipo técnico |
| Sobrecarga documental sin cierre técnico real | Baja | Media | ligar entregables documentales a evidencia en código |

### 5.8 Criterios de terminado (Definition of Done)

- Ítems S3 de calidad/escalabilidad implementados y validados.
- Regresión funcional controlada por pruebas.
- Documentación sincronizada con estado real del repositorio.

---

## 6. Tabla comparativa Sprint 2 vs Sprint 3

| Dimensión | Sprint 2 | Sprint 3 |
|---|---|---|
| Enfoque principal | Seguridad y estabilidad bloqueante | Calidad estructural y escalabilidad |
| Naturaleza del trabajo | Correcciones críticas + hardening | Refactor y evolución técnica |
| Riesgo técnico | Alto (cambios de autenticación/autorización) | Medio (modularización y contratos) |
| Impacto inmediato en producción | Muy alto | Alto, principalmente a mediano plazo |
| Dependencia de negocio | Alta (continuidad operativa) | Media (preparación crecimiento) |
| Resultado esperado | Base segura para release controlado | Base mantenible y preparada para escalar |

---

## 7. Riesgos de arrastre

1. **Seguridad incompleta si Sprint 2 no cierra al 100%**: cualquier remanente de AuthZ compromete todo el roadmap.
2. **Divergencia entre motores de datos**: si no se homogeniza contrato, aumentan bugs en campo.
3. **Falta de disciplina de release**: sin CI estricto, el proyecto puede reintroducir fallos críticos.
4. **Crecimiento funcional sin refactor**: incrementa costo de mantenimiento y tiempos de soporte.

---

## 8. Recomendaciones de ejecución

1. **Gobernanza de sprint:** cada historia crítica debe tener criterio de seguridad verificable (test negativo incluido).
2. **Entrega incremental:** PRs pequeños y trazables por dominio (auth, backup, CI, IPC, datos).
3. **Calidad continua:** imponer checklist de PR (seguridad, pruebas, logging, documentación).
4. **Sincronización funcional-técnica:** cada avance de código debe reflejarse en documentación de arquitectura y pruebas.
5. **Gestión de deuda técnica visible:** tablero separado de deuda con métricas de reducción por sprint.

---

## Clasificación consolidada de pendientes

| Categoría | Pendientes clave | Sprint objetivo |
|---|---|---|
| Obligatorio para seguridad | AuthZ main-side, bootstrap credenciales, secrets management | Sprint 2 |
| Obligatorio para estabilidad | CI gate, lint operativo, restore verificable | Sprint 2 |
| Recomendable para calidad | schemas IPC, reducción `any`, refactor dominios, logging estructurado | Sprint 3 |
| Recomendable para escalabilidad | paridad SQLite/MySQL, diseño multi-caja/multi-sede | Sprint 3 |

---

### Cierre

La distribución propuesta mantiene equilibrio entre urgencia y factibilidad: Sprint 2 cierra bloqueantes de salida seria a producción, y Sprint 3 consolida calidad y base de escalamiento sin comprometer la operación existente.
