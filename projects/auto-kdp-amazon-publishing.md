# auto-kdp: Automatización Publicación Amazon KDP

## metadata
created: 2026-05-06
tags: [automation, amazon, kdp, publishing, puppeteer, typescript]
status: researching
source: https://github.com/ekr0/auto-kdp

---

## Resumen

**auto-kdp** es una CLI en TypeScript que automatiza la creación y actualización de libros en **Amazon KDP** (Kindle Direct Publishing) usando Puppeteer para controlar un navegador Chrome real.

> "Command-line tool to create or update books on Amazon KDP book publishing site"

El autor lo creó para su propio uso y lo liberó como open source. Lo recomienda para **100+ libros**. Para poquitos libros no vale la pena.

---

## Stack Tecnológico

- **TypeScript** (95.7%)
- **Puppeteer** + **puppeteer-extra** + **puppeteer-extra-plugin-stealth**
- **Jest** para testing
- **Commander** para CLI
- **CSV parser/writer** para config

---

## Cómo Funciona

```
books.csv + books.conf + PDFs/
         ↓
   auto-kdp (CLI)
         ↓
  Puppeteer (controla Chrome con Stealth plugin)
         ↓
   Amazon KDP (web)
```

1. Lee configuración desde `books.csv` y `books.conf`
2. Controla Chrome simulando clicks humanos (con stealth para evitar detección)
3. Solo requiere login manual **1 vez** (cookies guardadas en `user_data/`)
4. Procesa libros secuencialmente
5. Genera `books.csv.new` con estado actualizado

---

## Archivos de Configuración

### books.csv

Un libro por fila. Columnas principales:

| Columna | Descripción |
|---------|-------------|
| `action` | Qué operaciones hacer (`all`, `book-metadata:content:publish`, etc.) |
| `title` | Título del libro |
| `authorFirstName` | Nombre del autor |
| `authorLastName` | Apellido del autor |
| `description` | Descripción del libro |
| `language` | Idioma |
| `priceUsd`, `priceEur` | Precios |
| `manuscriptLocalFile` | Ruta al PDF del manuscrito |
| `coverLocalFile` | Ruta al PDF de la portada |
| `isbn` | ISBN (se obtiene de KDP o se provee) |
| `pubStatus` | Estado de publicación (scraped) |

### books.conf

Valores por defecto para todos los libros:

```bash
authorFirstName = Walter
authorLastName = White
language = Spanish
paperTrim = 6x9
paperCoverFinish = glossy
paperColor = premium-color
paperBleed = yes
primaryMarketplace = us
```

---

## Sistema de Acciones

Cada acción es una tarea discrete en KDP. Se encadenan con `:`.

### shortcut `all`
```bash
book-metadata:content-metadata:scrapeIsbn:produceManuscript:content:pricing:publish:scrape:scrapeAmazonCoverImageUrl
```

### Acciones individuales

| Acción | Descripción |
|--------|-------------|
| `book-metadata` | Título, autor, descripción, categorías BISAC, keywords, idioma |
| `content-metadata` | Configuración papel (color, bleed, glossy/matte, trim size) |
| `scrapeIsbn` | Obtener ISBN asignado por KDP (cuando falla en content) |
| `produceManuscript` | Ejecuta comando shell para generar PDF (ej: LaTeX) |
| `content` | **Sube PDF manuscrito + cover**, lanza previewer, approve |
| `pricing` | Configura precios por marketplace (US, UK, EU, JP, etc.) |
| `publish` | Click en "Publish your Paperback Book" |
| `scrape` | Extrae estado, ISBN, fecha publicación |
| `scrapeAmazonCoverImageUrl` | Obtiene URL de cover de Amazon |
| `assignIsbn` | "Get a free KDP ISBN" |
| `archive` | Archiva un libro |
| `set-series-title` | Configura serie |
| `remove-series-title` | Elimina serie |

---

## Flujo de Ejecución Detallado

### 1. ensureLoggedIn()
```typescript
await page.goto(Urls.CREATE_PAPERBACK);
await page.waitForSelector('#data-print-book-title');
// Si no está logueado → KDP redirige a login
// Login manual solo la primera vez
```

### 2. book-metadata (update-book-metadata.ts)
```typescript
// URL: EDIT_PAPERBACK_DETAILS
await updateTextFieldIfChanged('#data-print-book-title', book.title, ...);
await updateTextFieldIfChanged('#data-print-book-author', book.authorName, ...);
await updateTextAreaIfChanged('#cke_1_contents > textarea', book.description, ...);
// Categorías, keywords, etc.
```

### 3. content (update-content.ts) — LA MÁS COMPLEJA
```typescript
// 1. Obtener ISBN si no tiene
await page.click('#free-print-isbn-btn-announce');
await page.click('#print-isbn-confirm-button-announce');
book.isbn = await page.evalValue('#free-print-isbn-accordion-row span...');

// 2. Seleccionar papel: color, bleed, glossy/matte
await page.click('#a-autoid-3-announce'); // premium-color

// 3. Seleccionar trim size
await page.click('#trim-size-btn-announce');
await page.click('#trim-size-popular-option-0-3-announce'); // 6x9

// 4. Subir cover PDF
await page.selectFile('#...cover...', book.coverLocalFile);
await page.waitForSelectorVisible('#...success', Timeouts.MIN_20);

// 5. Subir manuscript PDF
await page.selectFile('#...interior...', book.manuscriptLocalFile);
await page.waitForSelectorVisible('#...success', Timeouts.MIN_20);

// 6. Confirmar AI-generated = No
await page.click('#section-generative-ai ... "no"');

// 7. Launch Previewer (~3.5 min)
await page.click('#print-preview-noconfirm-announce');
await page.waitForNavigation(Timeouts.MIN_15);

// 8. Approve preview
await page.click('#printpreview_approve_button_enabled a');

// 9. Save
await page.click("#save-and-continue-announce");
```

### 4. pricing (update-pricing.ts)
```typescript
await updateAllPrices(book, page, verbose);
// Itera por marketplace y configura royalty + precio
```

### 5. publish (publish.ts)
```typescript
await page.goto(Urls.EDIT_PAPERBACK_PRICING.replace('$id', book.id));
await updateAllPrices(book, page, verbose); // workaround bug KDP
await page.click('button:contains("Publish your Paperback Book")');
```

---

## Sistema de Variables

auto-kdp soporta interpolación y condicionales en los campos:

```bash
# Interpolación
title = Where is my ${animal}?

# Condicional
isGirl = $vareq ${gender} == F
possessivePronoun = $varif ${isGirl} ?? her :: his

# Referencia entre libros
asinGiraffe = $varbookref ${animal} == Giraffe !! asin
```

---

## Protección Anti-Detección

```typescript
// Rate limiting incorporado
if (numConsecutiveFastOperations > 200) {
    sleep(30); // Pausa si demasiadas ops rápidas
}
```

Usa `puppeteer-extra-plugin-stealth` que oculta:
- WebGL renderer
- Navigator plugins
- Chrome runtime
- etc.

---

## Limitaciones y Riesgos

### ⚠️ CRÍTICOS

1. **Amazon puede banear la cuenta**
   - Aunque usa stealth plugin, Amazon mejora constantemente detección
   - Si detecta bot → riesgo de suspensión

2. **Fragilidad ante cambios en KDP**
   - Selectors hardcodeados: `'#free-print-isbn-btn-announce'`, etc.
   - Si Amazon cambia un ID HTML → todo falla
   - El autor dice que en 2 años solo falló 1 vez, pero es inherente al enfoque

3. **No soporta:**
   - Subtítulos
   - Kindle books (solo paperback)
   - Contributors múltiples (ilustrador único)
   - Hardcover

4. **Content upload requiere ventana visible**
   - Si cualquier libro tiene acción `content`, corre en modo no-headless

5. **Login manual sigue siendo necesario para CAPTCHA**

### Ventajas a pesar de los riesgos

- Para 100+ libros, el tiempo ahorrado justifica el riesgo
- El author lo usa en producción desde hace años
- Es open source → puedes mantenerlo tú mismo

---

## Estructura del Código

```
auto-kdp/src/
├── index.ts              # CLI + main loop
├── browser.ts           # Puppeteer wrapper (BrowserInterface, PuppeteerPage)
├── book/
│   ├── book.ts          # Modelo de libro con resolución de variables
│   ├── book-file.ts     # Lectura/escritura CSV
│   ├── book-list.ts     # Colección de libros
│   └── keys.ts         # Definición de campos KDP soportados
├── action/
│   ├── ensure-logged-in.ts
│   ├── update-book-metadata.ts  # ~400 líneas
│   ├── update-content.ts       # ~240 líneas
│   ├── update-pricing.ts
│   ├── publish.ts
│   ├── scrape.ts
│   └── ...
└── util/
    ├── action-params.ts  # Parámetros compartidos entre acciones
    ├── timeouts.ts      # Constantes: SEC_1, MIN_3, MIN_15, etc.
    └── utils.ts         # Helpers
```

---

## API Ofificial KDP

Amazon tiene una **KDP API** oficial para publicación programática autorizada:
- https://developer.amazon.com/docs/kdp/start.html
- Requiere aprobación
- Es la forma "oficial" de automatizar sin riesgo de ban

---

## Cómo Usar

### Instalación
```bash
git clone https://github.com/ekr0/auto-kdp.git
cd auto-kdp
npm install
```

### Ejecución (primera vez con login)
```bash
ts-node src/index.ts \
  --books books.csv \
  --config books.conf \
  --content-dir ./libros/ \
  --user-data ./user_data \
  --verbose \
  --headless=no
```

### Ejecución normal
```bash
ts-node src/index.ts \
  --books books.csv \
  --config books.conf \
  --content-dir ./libros/ \
  --user-data ./user_data \
  --verbose
```

### dry-run (sin cambios reales)
```bash
ts-node src/index.ts ... --dry-run
```

---

## Tests

```bash
npm test
# 93/95 pasan
# 2 fallan por timezone (bug de test, no de producción)
# Coverage: 83.37% statements
```

---

## Alternativas

1. **KDP API oficial** (developer.amazon.com/docs/kdp/) — La vía recomendada si Amazon te aprueba
2. **Services.io** — Plataformas de publicación que ofrecen automatización
3. ** IngramSpark** —另一 KDP 竞争对手

---

##下一步

- [ ] Evaluar si usar auto-kdp o KDP API oficial
- [ ] Crear books.csv y books.conf para los libros del usuario
- [ ] Probar con 1 libro en modo dry-run
- [ ] Si funciona, considerar integración con pipeline de generación de PDFs

---

## Recursos

- Repo: https://github.com/ekr0/auto-kdp
- README completo en el repo
- Author: ekr0 (elutek)
