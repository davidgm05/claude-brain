# Sesión: auto-kdp Research — 2026-05-06

## metadata
type: session
date: 2026-05-06
duration: ~1 hora
participant: user + claude
status: completed

---

## Objetivo

Evaluar viabilidad de auto-kdp para automatizar publicación de libros en Amazon KDP.

---

## Descubrimientos

### auto-kdp

**Repo:** https://github.com/ekr0/auto-kdp

CLI en TypeScript que usa Puppeteer para automatizar clicks en KDP.

**Características:**
- Upload manuscript + cover PDFs
- Configuración de metadatos, papel, precios
- Publicación con 1 click
- Scraping de estado/ISBN
- Sistema de variables para templates

**Pros:**
- Open source, bien mantenido
- Author lo usa en producción 2+ años
- Funciona para 100+ libros

**Contras:**
- Fragilidad ante cambios en UI de KDP
- Riesgo de ban de cuenta Amazon
- Solo paperback (no Kindle)
- No soporta subtítulos

---

## Decisiones

1. **Guardar investigación en Obsidian** ✅
2. **Evaluar si el usuario quiere proseguir** → pendiente

---

## Preguntas Abiertas

- ¿Cuántos libros quiere publicar?
- ¿Ya tiene los PDFs (manuscrito + cover)?
- ¿Quiere usar KDP API oficial o auto-kdp (risk vs control)?
- ¿Los libros son paperback + simples?

---

## Tags

#auto-kdp #kdp #amazon #publishing #research
