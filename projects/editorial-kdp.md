# Editorial-KDP Project Status

## metadata
created: 2026-05-06
updated: 2026-05-06
status: Phase 1 Complete, Phase 2 Planning
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
│  Content Generator (Claude agents nativos)                    │
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

## Agentes (Phase 2)

En lugar de OpenClaw, usamos **agentes nativos de Claude Code**:

| Agente | Rol |
|--------|-----|
| `ideator` | Genera concepto + outline + título del libro |
| `writer` | Escribe capítulos en Markdown |
| `expander` | Expande contenido con ejemplos, analogías |
| `verifier` | QA final + consistency check |
| `cover-gen` | Genera portada HTML/CSS |
| `formatter` | Convierte Markdown → PDF/EPUB |
| `autokdp-svc` | Publica en KDP |

---

## Pipeline de Agentes (Phase 2)

```typescript
// Pipeline de generación de libro
const bookPipeline = [
  { agent: 'ideator', input: { niche, ageRange, genre } },
  { agent: 'writer', input: { outline } },
  { agent: 'expander', input: { chapters } },
  { agent: 'verifier', input: { content } },
  { agent: 'cover-gen', input: { title, theme } },
  { agent: 'formatter', input: { markdown } },
  { agent: 'autokdp-svc', input: { bundle } },
];
```

### Agente: ideator
- Input: `{ niche, ageRange, genre, language }`
- Output: `{ title, oneSentencePromise, targetReader, tableOfContents, styleGuide, chapterFiles }`

### Agente: writer
- Input: `{ title, outline, styleGuide }`
- Output: capítulos en Markdown (~60 páginas total)

### Agente: expander
- Input: `{ rawContent, ageRange }`
- Output: contenido expandido con ejemplos, ejercicios

### Agente: verifier
- Input: `{ expandedContent, outline }`
- Output: `{ finalContent, issuesFound[] }`

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
│   │   ├── book_generator.ts     # Orchestrator (Phase 2)
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

### 🔴 En Progreso (Fase 2)
- [ ] Pipeline de agentes Claude Code nativos
- [ ] CLI completo de generación: `npm run generate -- --niche=...`
- [ ] Testing del pipeline completo

### 🟡 Pendiente (Fase 3)
- [ ] Dashboard React
- [ ] Series/characters reutilizables
- [ ] Multi-language support

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

# CLI usage (cuando Phase 2 esté listo)
npm run generate -- --niche="marketing digital" --genre="noficcion"
```

---

## Notas Técnicas

- Usa `puppeteer-extra` + `stealth-plugin` para evitar detección
- Pexels API: imágenes de uso libre (requiere API key en PEXELS_API_KEY)
- Dimensiones KDP: 6x9" standard, spine = pageCount × 0.002252"
- Auto-kdp requiere login manual la primera vez (cookies guardadas en user_data)

---

## Próximo Paso

**Fase 2:** Crear pipeline de agentes con TeamCreate de Claude Code para orchestración de generación de contenido.
