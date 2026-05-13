---
title: Formato Portadas KDP Paperback - 2026-05-13
date: 2026-05-13
tags: [editorial-kdp, kdp, book-covers, workflow]
---

# Formato Portadas KDP Paperback - Actualizado 2026-05-13

## Medidas KDP Paperback (6×9, ~80 páginas)

| Elemento | Pulgadas | Pixeles @ 300 DPI |
|---------|----------|-------------------|
| Front cover | 6.25" | 1875px |
| Spine | 0.18" | 54px |
| Back cover | 6.25" | 1875px |
| **TOTAL ANCHO** | **12.68"** | **3804px** |
| Alto | 9.25" | 2775px |

## Estructura Plantilla Completa

Plantilla: `kdp_complete.html` en `/home/ubuntu/editorial-kdp/dist/services/cover_templates/`

Incluye:
- **Contraportada** (back cover) — con synopsis del libro
- **Spine** — nombre del autor + páginas
- **Portada frontal** — imagen Unsplash + título/autor

## Flujo de Generación

1. Buscar imagen Unsplash por tema del libro
2. Usar plantilla `kdp_complete.html`
3. Renderizar con Puppeteer a PNG @ 300 DPI
4. Dimensiones: 3804 × 2775 px
5. Formato: PNG (no PDF) para KDP Cover Creator

## API Unsplash

- Key: `kBSnZ1iLWh0BZwhRuvLrYm7YJ3k3HTieOoh3doXpHqg`
- Buscar por: `tema + fantasy/CGI/3d render` para portadas infantiles

## Telegram Bot

- Token: `8373950857:AAFXRs5dHgNZV0rZ5q0O-VVOlY1d283ItUQ`
- Chat ID: `1402660145`

## Plantillas Disponibles

| Plantilla | Uso |
|-----------|-----|
| `kdp_complete.html` | **PORTADA COMPLETA KDP** (back + spine + front) |
| `infantil_kdp.html` | Solo front cover |
| `infantil_simple.html` | Diseño simple minimalista |
| `infantil_new.html` | Diseño premium con efectos |

## Ejemplo Generado

- **El Rey del Campo** — 2026-05-13
- Imagen: Fairytale Castle (Unsplash)
- Formato: PNG 3804×2775 @ 300 DPI
- Enviado a Telegram ✅

## Tags
#editorial-kdp #kdp #book-covers #workflow