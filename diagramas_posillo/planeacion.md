# Relación de diagramas por sprint

> **Nota importante:** La siguiente asignación se realizó con base en el análisis del software POS entregado.  
> La correspondencia entre las Historias de Usuario (HU) y los diagramas **no siempre es exacta**, porque varias HU del cronograma describen un sistema orientado a **inventario y reparación de equipos**, mientras que el proyecto analizado corresponde a un **sistema POS** enfocado en ventas, caja, productos, usuarios, licencias y reportes.  
> Por ello, en algunos casos la equivalencia es **funcional** y no literal.

---

## Resumen general por sprint

### Sprint 1
Los diagramas que corresponden principalmente a este sprint son:

- `01_inicio_y_licencia.svg`
- `02_login.svg`
- `03_consultar_inventario.svg`
- `04_gestionar_producto.svg`
- `05_buscar_producto_en_pos.svg`

### Sprint 2
Los diagramas que corresponden principalmente a este sprint son:

- `05_buscar_producto_en_pos.svg`
- `06_realizar_venta_y_generar_factura.svg`

### Sprint 3
Los diagramas que corresponden principalmente a este sprint son:

- `07_imprimir_factura_y_abrir_cajon.svg`
- `08_suspender_reanudar_y_devolver_venta.svg`
- `09_apertura_y_cierre_de_caja.svg`
- `10_registrar_y_consultar_gastos.svg`
- `11_reportes_y_cierre_diario.svg`
- `12_gestion_de_usuarios.svg`

---

# Sprint 1

## Diagramas sugeridos para presentar

- `01_inicio_y_licencia.svg`
- `02_login.svg`
- `03_consultar_inventario.svg`
- `04_gestionar_producto.svg`
- `05_buscar_producto_en_pos.svg`

## Justificación general del sprint

Este sprint agrupa los diagramas relacionados con:

- acceso inicial al sistema
- validación de licencia
- autenticación de usuarios
- registro y gestión básica del inventario
- consulta y búsqueda de productos

---

## HU-001 — Registrar equipos en inventario

**Diagrama más cercano:**

- `04_gestionar_producto.svg`

**Justificación:**  
Este diagrama cubre el alta y edición de productos dentro del inventario. Aunque la HU habla específicamente de “equipos”, en el sistema POS analizado el equivalente funcional es el módulo de gestión de productos.

**Observación:**  
No coincide de forma exacta con un formulario especializado de registro de equipos, pero sí representa la funcionalidad más cercana dentro del proyecto real.

---

## HU-002 — Actualizar estado del equipo

**Diagrama más cercano:**

- `04_gestionar_producto.svg`

**Justificación:**  
La HU plantea la actualización del estado de un equipo. En el software POS revisado no se identificó un flujo técnico específico de estados como “Disponible”, “En reparación” o “Diagnosticado”. Por ello, esta HU solo puede asociarse de forma funcional a la actualización de datos del producto.

**Observación:**  
La equivalencia es parcial.

---

## HU-003 — Consultar inventario disponible

**Diagramas que corresponden mejor:**

- `03_consultar_inventario.svg`
- `05_buscar_producto_en_pos.svg`

**Cómo usar cada uno:**

- Si se quiere representar la consulta de inventario desde un enfoque administrativo, el más adecuado es `03_consultar_inventario.svg`.
- Si se quiere representar la búsqueda operativa de productos desde caja o desde el flujo de venta, el más adecuado es `05_buscar_producto_en_pos.svg`.

---

## HU-004 — Eliminar equipos del inventario

**Diagrama más cercano:**

- `04_gestionar_producto.svg`

**Justificación:**  
Este diagrama representa la gestión general de productos, incluyendo operaciones tipo CRUD sobre inventario.

**Observación:**  
Sirve como aproximación funcional, pero no garantiza que el sistema implemente exactamente un borrado lógico con un campo como `deleted_at`, tal como aparece en la planeación del sprint.

---

## Diagramas complementarios del sprint

### `01_inicio_y_licencia.svg`
Se recomienda ubicar este diagrama en el Sprint 1 porque representa el flujo de arranque del sistema y la validación de licencia, que forman parte del acceso inicial al software.

### `02_login.svg`
También conviene incluirlo en el Sprint 1 porque representa la autenticación del usuario, que naturalmente ocurre antes de las operaciones de inventario o ventas.

---

# Sprint 2

## Diagramas sugeridos para presentar

- `05_buscar_producto_en_pos.svg`
- `06_realizar_venta_y_generar_factura.svg`

## Justificación general del sprint

Este sprint reúne los diagramas vinculados con:

- selección de productos en el proceso de venta
- registro de la venta
- interacción con cliente durante la transacción
- generación lógica de la factura

---

## HU-005 — Registrar diagnóstico del equipo

**Correspondencia:**  
No tiene una correspondencia clara en el POS analizado.

**Justificación:**  
No se identificó un módulo de diagnóstico técnico de equipos dentro del proyecto revisado.

---

## HU-006 — Registrar proceso de reparación

**Correspondencia:**  
No tiene una correspondencia clara en el POS analizado.

**Justificación:**  
El sistema entregado no contiene un módulo de reparación técnica de equipos como parte central de su arquitectura.

---

## HU-007 — Actualizar proceso de reparación

**Correspondencia:**  
No tiene una correspondencia clara en el POS analizado.

---

## HU-008 — Consultar historial de reparaciones

**Correspondencia:**  
No tiene una correspondencia clara en el POS analizado.

---

## HU-009 — Registrar venta de equipo

**Diagrama principal:**

- `06_realizar_venta_y_generar_factura.svg`

**Diagramas complementarios:**

- `05_buscar_producto_en_pos.svg`
- `07_imprimir_factura_y_abrir_cajon.svg`

**Justificación:**  
Esta HU sí tiene una correspondencia bastante clara con el software POS. El diagrama `06_realizar_venta_y_generar_factura.svg` representa el flujo central de la venta y la generación de la factura.  
El diagrama `05_buscar_producto_en_pos.svg` complementa la etapa de búsqueda o selección del producto.  
El diagrama `07_imprimir_factura_y_abrir_cajon.svg` puede utilizarse como apoyo si se quiere mostrar la salida física posterior a la venta.

---

## HU-013 — Registrar cliente

**Correspondencia más cercana:**

- `06_realizar_venta_y_generar_factura.svg`

**Justificación:**  
En el proyecto analizado no se dejó un diagrama independiente para gestión de clientes. La relación más cercana aparece dentro del flujo de venta, donde el cliente puede intervenir como parte de la transacción.

**Observación:**  
No se recomienda presentarlo como equivalencia formal exacta para un módulo de gestión de clientes, sino como una asociación funcional parcial.

---

## Aclaraciones del sprint

Es importante dejar explícito que:

- Las HU de diagnóstico y reparación **no pertenecen al alcance funcional principal del POS analizado**.
- La HU de registro de cliente **no quedó representada mediante un diagrama exclusivo** dentro de los diagramas preparados.

---

# Sprint 3

## Diagramas sugeridos para presentar

- `07_imprimir_factura_y_abrir_cajon.svg`
- `08_suspender_reanudar_y_devolver_venta.svg`
- `09_apertura_y_cierre_de_caja.svg`
- `10_registrar_y_consultar_gastos.svg`
- `11_reportes_y_cierre_diario.svg`
- `12_gestion_de_usuarios.svg`

## Justificación general del sprint

Este sprint agrupa los diagramas relacionados con:

- salida final del proceso de venta
- impresión y caja
- anulación o devolución de ventas
- operaciones de apertura y cierre de caja
- gestión de gastos
- reportería
- administración de usuarios

---

## HU-010 — Generar factura de venta

**Diagramas que corresponden directamente:**

- `06_realizar_venta_y_generar_factura.svg`
- `07_imprimir_factura_y_abrir_cajon.svg`

**Distribución recomendada:**

- `06_realizar_venta_y_generar_factura.svg` representa la **generación lógica** de la venta y la factura.
- `07_imprimir_factura_y_abrir_cajon.svg` representa la **salida física o impresión** de la factura.

---

## HU-011 — Consultar historial de ventas

**Diagrama más cercano:**

- `11_reportes_y_cierre_diario.svg`

**Justificación:**  
Este diagrama puede utilizarse para justificar la consulta del historial de ventas desde un enfoque de reportes o revisión operativa.

**Observación:**  
Conviene describirlo como “consulta y reportería de ventas”.

---

## HU-012 — Anular venta registrada

**Diagrama correspondiente:**

- `08_suspender_reanudar_y_devolver_venta.svg`

**Justificación:**  
Este diagrama representa el flujo más cercano a una anulación o devolución operativa de venta.

**Observación:**  
En el sistema revisado se interpreta más como devolución o reversión de una venta ya registrada.

---

## HU-014 — Actualizar datos del cliente

**Correspondencia:**  
No tiene una correspondencia clara en los diagramas actuales.

---

## HU-015 — Consultar historial del cliente

**Correspondencia:**  
No tiene una correspondencia clara en los diagramas actuales.

---

## HU-016 — Eliminar cliente

**Correspondencia:**  
No tiene una correspondencia clara en los diagramas actuales.

---

## HU-017 — Generar reportes de ventas

**Diagrama correspondiente:**

- `11_reportes_y_cierre_diario.svg`

**Justificación:**  
Representa adecuadamente la generación y consulta de reportes operativos del sistema.

---

## HU-018 — Generar reportes de inventario

**Diagramas más cercanos:**

- `03_consultar_inventario.svg`
- `11_reportes_y_cierre_diario.svg`

**Justificación:**  
No se preparó un diagrama exclusivo de “reporte de inventario”, pero estos dos diagramas permiten sustentar esa funcionalidad desde la consulta del inventario y la reportería general.

---

## HU-019 — Generar reportes de reparaciones

**Correspondencia:**  
No tiene una correspondencia clara en el POS analizado.

**Justificación:**  
El proyecto no contiene un módulo explícito de reparaciones técnicas como el descrito en el cronograma.

---

## HU-020 — Exportar reportes

**Diagrama más cercano:**

- `11_reportes_y_cierre_diario.svg`

**Justificación:**  
Es el diagrama que mejor representa la consulta y generación de reportes dentro del sistema.

**Observación:**  
La exportación a XLSX o PDF no quedó modelada como un diagrama independiente, por lo que esta equivalencia es funcional, no exacta.

---

## Diagramas complementarios del sprint

### `09_apertura_y_cierre_de_caja.svg`
Se recomienda ubicarlo en este sprint porque complementa las operaciones finales del ciclo de venta y la gestión de caja.

### `10_registrar_y_consultar_gastos.svg`
Se recomienda incluirlo en este sprint como parte de la gestión financiera y operativa del sistema.

### `12_gestion_de_usuarios.svg`
Se sugiere usarlo como diagrama de apoyo para funciones administrativas del sistema, especialmente cuando se requiera evidenciar la gestión de acceso o administración de usuarios.

---

# Recomendación final de presentación

## Sprint 1
Presentar:

- `01_inicio_y_licencia.svg`
- `02_login.svg`
- `03_consultar_inventario.svg`
- `04_gestionar_producto.svg`
- `05_buscar_producto_en_pos.svg`

**Cobertura funcional:**

- inicio del sistema
- validación de licencia
- autenticación
- registro de inventario
- actualización de datos del producto
- consulta de inventario
- búsqueda de productos

---

## Sprint 2
Presentar:

- `05_buscar_producto_en_pos.svg`
- `06_realizar_venta_y_generar_factura.svg`

**Cobertura funcional:**

- búsqueda y selección del producto
- registro de venta
- generación lógica de factura

**Aclaración recomendada:**

- Las HU de diagnóstico y reparación no corresponden al alcance real del POS analizado.
- La HU de registro de cliente no quedó representada mediante un flujo independiente.

---

## Sprint 3
Presentar:

- `07_imprimir_factura_y_abrir_cajon.svg`
- `08_suspender_reanudar_y_devolver_venta.svg`
- `09_apertura_y_cierre_de_caja.svg`
- `10_registrar_y_consultar_gastos.svg`
- `11_reportes_y_cierre_diario.svg`
- `12_gestion_de_usuarios.svg`

**Cobertura funcional:**

- impresión de factura
- apertura de cajón
- anulación o devolución de venta
- operaciones de caja
- gestión de gastos
- generación de reportes
- administración de usuarios

---

# Conclusión

La organización anterior permite distribuir los diagramas de forma coherente por sprint, tomando en cuenta la funcionalidad real del software POS analizado.  
Aunque varias Historias de Usuario del cronograma original describen módulos que no existen de forma explícita en el proyecto, la asignación presentada conserva una relación funcional válida entre los diagramas generados y los procesos principales del sistema.