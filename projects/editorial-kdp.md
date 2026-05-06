# Editorial-KDP Project Status

## metadata
created: 2026-05-06
updated: 2026-05-06
status: Phase 1 Complete
tags: [editorial, kdp, amazon, automation, books]

---

## Overview

Sistema de generación y publicación automática de libros en Amazon KDP.

**Repo:** `/home/ubuntu/editorial-kdp`
**Integraciones:** auto-kdp (`/home/ubuntu/auto-kdp`)

---

## Arquitectura Implementada (Fase 1)

```
┌─────────────────────────────────────────────────────────────────┐
│  INPUT: niche + config                                         │
│    ↓                                                           │
│  Content Generator (OpenClaw agents - reuse BookFactory)        │
│    ↓ (~60 páginas markdown)                                     │
│  Formatter: Markdown → PDF/EPUB (src/services/formatter.ts)    │
│    ↓                                                           │
│  Cover Generator: HTML/CSS + Pexels → PDF                       │
│  (src/services/cover_generator.ts + cover_templates/)         │
│    ↓                                                           │
│  Auto-KDP Uploader (src/services/autokdp.ts)                   │
│    ↓ 📖 Published                                             │
└─────────────────────────────────────────────────────────────────┘
```

---

## Servicios Implementados

### 1. Cover Generator (`cover_generator.ts`)
- **Pexels API** para imágenes de uso libre
- 3 templates HTML: infantil, ficcion, noficcion
- Renderizado con Puppeteer (stealth mode)
- Dimensiones KDP correctas (cover_dimensions.ts)

### 2. Formatter (`formatter.ts`)
- Markdown → PDF con Puppeteer
- Markdown → EPUB con JSZip
- Estimación de páginaCount por edad

### 3. Auto-KDP Integration (`autokdp.ts`)
- Genera books.csv y books.conf
- Copia PDFs a content dir
- Ejecuta auto-kdp pipeline

### 4. Cover Dimensions (`cover_dimensions.ts`)
- Calcula spine width según page count y paper type
- White paper: 0.002252" por página
- Cream paper: 0.0025" por página

---

## Estructura de Archivos

```
editorial-kdp/
├── src/
│   ├── index.ts                    # CLI entry point
│   ├── services/
│   │   ├── autokdp.ts            # KDP publishing
│   │   ├── book_generator.ts     # Orchestrator
│   │   ├── cover_dimensions.ts   # KDP calculations
│   │   ├── cover_generator.ts    # Cover generation
│   │   ├── cover_templates/     # HTML templates
│   │   │   ├── infantil.html
│   │   │   ├── ficcion.html
│   │   │   └── noficcion.html
│   │   ├── formatter.ts          # PDF/EPUB generation
│   │   └── pexels.ts            # Pexels API client
│   ├── types/
│   │   └── index.ts
│   └── utils/
│       └── logger.ts
├── auto-kdp/                      # Integration
├── output/
│   ├── bundles/
│   └── logs/
└── package.json
```

---

## Estado de Desarrollo

### ✅ Completado (Fase 1)
- [x] Cover generator con HTML/CSS + Pexels + Puppeteer
- [x] Formatter Markdown → PDF/EPUB real
- [x] Auto-KDP integration
- [x] Cover dimensions calculator (spine, bleed, trim sizes)
- [x] 3 templates de portada (infantil, ficcion, noficcion)
- [x] CLI básico con commander

### ⚠️ Pendiente (Fase 2)
- [ ] Integración con OpenClaw agents (ideator/writer/expander)
- [ ] CLI completo de generación
- [ ] Dashboard React
- [ ] Testing del pipeline completo

---

## Comandos

```bash
# Install
cd /home/ubuntu/editorial-kdp && npm install

# Type check
npx tsc --noEmit

# Generate cover test
npx ts-node src/services/cover_generator.ts

# Format book test
npx ts-node src/services/formatter.ts
```

---

## Notas Técnicas

- Usa `puppeteer-extra` + `stealth-plugin` para evitar detección
- Pexels API: imágenes de uso libre (requiere API key)
- Dimensiones KDP: 6x9" standard, spine = pageCount × 0.002252"
- Auto-kdp requiere login manual la primera vez (cookies guardadas en user_data)

---

## siguiente paso

Fase 2: Integrar con OpenClaw agents para generación de contenido completo
