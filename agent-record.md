<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Agent Record — Tunable Snare Frame Array

- **Lane**: Round 5 / Lane 06
- **Runtime**: Claude Sonnet 4.6 — sprint persona pane
- **Skills loaded**: `sheet-metal`, `instrument-maker`
- **Date**: 2026-05-21

## qmd queries run + key citations

```bash
qmd search "snare drum frame" -c instrument-builds
qmd search "frame drum sheet metal" -c instrument-builds
qmd search "cylindrical shell forming" -c instrument-builds
qmd search "membrane drum tuning bessel" -c instrument-wiki
```

Key citations:
- `instrument-wiki/synthesis/wolfram-model-patterns.md` — "Membrane and shell studies" pattern lists `frame-drum` with `head diameter, membrane surface density, tension, shell geometry` as recommended Wolfram parameters; `f01 range, tuning sensitivity` as expected outputs. This packet hits all four input parameters.
- `handpan/wolfram-starter.wl` — used as structural template for the Bessel membrane model section (same `alpha01 = 2.4048` approach, adapted for 3-drum array).
- `handpan/design.md` — used as template for frontmatter schema, acoustic model section structure, and build classification conventions.
- `frame-drum/agent-record.md` — confirmed standard Remo Ambassador head σ ≈ 0.18 kg/m² and lug hardware thread size (8-32 UNC).
- `bass-surface-drum/wolfram-starter.wl` — cross-checked Bessel J₀ first zero (α₀₁ = 2.4048) and confirmed hoop tension formula derivation.

## Major assumptions

1. **Head surface density σ = 0.18 kg/m²** — manufacturer data for Remo Ambassador Mylar. Real σ varies ±10% with humidity and head age. The ±50 cents tolerance in validation gates absorbs this.
2. **Effective membrane radius uses catalog dimensions**: 10" = 254mm OD → r = 127mm; 8" = 203mm → r = 101.5mm; 6" = 152mm → r = 76mm. Actual Remo head manufacturer dimensions may differ by 1–2mm; this shifts target tension by ~2–4%, well within tuning adjustment range.
3. **Frame cut-out = head OD + 4mm clearance** (2mm each side). This prevents drum from dropping fully through; drum rests on the head rim overhanging the cut-out. Confirmed as standard practice for lap-steel frame drums.
4. **TIG butt weld seam (not lock seam)** — chosen for acoustic rigidity. Lock seam introduces a raised bead that can buzz at membrane resonances.
5. **K-factor = 0.44** for 1.5mm CRS at 3mm inside radius — conservative estimate for cold-rolled steel at this gauge/radius ratio. Sheet_metal_math.py confirmed BA = 5.74mm.
6. **Lug count**: 6 per drum (industry standard for 6"–10" snare drum; 4 minimum for uniform tension, 8 for pro-level). 6 balances cost and tuning resolution.
7. **Snare wire count**: 8 strands (6"), 10 strands (8"), 12 strands (10") — standard industry spec for head diameter.

## Unknowns for next round

- **Shell C (152mm) roll feasibility** — highest risk unknown. 1.0mm CRS at 76mm radius approaches limits of typical Maker Nexus slip-roll. Coupon test (VAL-003) must run before any shells are cut. May require annealing or ordering pre-rolled shells.
- **Drum B headburst margin** — 2540 N/m required vs ~3000 N/m Remo burst spec = 15% margin. Acceptable but thin. First prototype head should be treated as sacrificial and tensioned slowly.
- **Counter-hoop fit tolerance** — standard Remo counter-hoops are spec'd ±0.5mm. Shell OD tolerance must match. VAL-001 through VAL-003 gate this.
- **Snare wire engagement geometry** — thumb-wheel bracket height and snare wire clearance under head will need physical adjustment. The design leaves vertical position unspecified pending prototype.
- **Cross-talk isolation** — VAL-018/019 gates cross-talk at −12 dB. Frame resonance coupling is model-unknown; rubber grommets may or may not be sufficient.

## Files produced

Total: **29 files** across 6 phases

| Phase | Files |
|-------|-------|
| feat/license | LICENSE, LICENSE-HARDWARE.md, LICENSE-DOCS.md |
| feat/design | README.md, design.md, parameters.csv, tuning-notes.md, tunable-snare-frame-array-starter.wl |
| feat/cad-and-flat-patterns | solidworks-plan.md, flat-pattern-checklist.md, bend-table.csv, cut-list.csv, drawings/.gitkeep, cad/.gitkeep |
| feat/fabrication-plan | fabrication-plan.md, assembly-manual.md, bom.csv, hardware.csv, sourcing.csv, supplier-rfq.md, cnc/operations.csv, cnc/setup-sheet.md |
| feat/validation-and-risks | validation.csv, risks.md, photo-shotlist.md, visual-bom-brief.md |
| docs/explorer-and-readme | explorer.html, learn-to-play/00-INDEX.md, learn-to-play/fingerings/README.md, learn-to-play/scales/README.md, learn-to-play/tunes/README.md, agent-record.md, card-for-showcase.html |

All files carry SPDX headers: `CC-BY-4.0` for docs/markdown/HTML; `CERN-OHL-W-2.0` for hardware data (CSV, WL).

## Acoustic model confidence

| Area | Confidence | Rationale |
|------|-----------|-----------|
| Pitch targets (D3/A3/D4) | **High** | Bessel J₀ model is well-validated for ideal membranes; α₀₁ = 2.4048 is exact |
| Required tensions | **Medium-high** | Linear in σ; ±10% on σ → ±10% on T; acceptance band handles this |
| Drum B burst margin | **Medium** | 15% margin; first-article test is mandatory gate |
| Shell C roll feasibility | **Low-medium** | 76mm radius on 1.0mm CRS is at edge of equipment spec; coupon required |
| Frame rigidity | **High** | 1.5mm CRS with 20mm flanges is structurally conservative for this scale |
| Cross-talk isolation | **Medium** | VAL-018/019 gates are model-unknown; rubber grommets are standard practice but unverified here |

## Key design decisions

- **D–A–D pitch set** (not D–F#–A major triad): power-chord voicing chosen because it works in any genre, has maximum sonic contrast between drums (pure fifths), and Drum B tension stays within Remo spec.
- **50mm / 40mm / 40mm shell depths** (A/B/C): shallow enough for low total frame depth (80mm web), deep enough for snare wire clearance.
- **Plasma cut frame** (not laser): 1.5mm CRS is within Maker Nexus Hypertherm 45XP envelope; plasma leaves a slight taper that helps shells seat.
- **Mode B-on-root file layout** (all files at repo root, no docs/ subdirectory): matches SHARED.md v5 packet convention.
