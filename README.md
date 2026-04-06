# sistetecni-pos-electron

POS offline para local físico de Sistetecni.

## Instalación
```bash
npm install
```

## Desarrollo
```bash
npm run dev
```

## Build
```bash
npm run build
```

## Empaquetar Windows
```bash
npm run package
```

## Ubicación de datos locales
- Base de datos SQLite: `%APPDATA%/Sistetecni POS/data/sistetecni-pos.db`
- Facturas PDF: `%APPDATA%/Sistetecni POS/invoices/`
- Backups: `%APPDATA%/Sistetecni POS/backups/`

## Credenciales iniciales
- No publicar credenciales por defecto en producción.
- Definir usuario administrador y contraseña segura durante instalación/puesta en marcha.
- Forzar cambio de contraseña inicial en el primer ingreso.
