<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CAD / Creative Tool Provenance Log

Status: V5 provenance stub.

No MCP, SolidWorks, OpenSCAD, Blender, Illustrator, Photoshop, Fusion, CNC, or
physical measurement tool was available during this Round 6 migration. This run
added only a README status boundary, a visual-output authority register, and
this provenance stub.

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| R6-2026-05-30-local | text edit | existing repo README/design packet plus V5 migration standard | `README.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | v5_migration_register | concept_only | self_checked | No CAD geometry, DXF coordinates, acoustic data, Wolfram execution, CNC toolpath, or measured prototype evidence was generated. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | parameters.csv, flat-pattern-checklist.md, solidworks-plan.md | cad/tunable-snare-frame-array.scad | cad_authoring | pending_measurement | self_checked | Parametric master: three rolled-cylinder shell envelopes (Drum A/B/C OD+depth) + mounting-frame flat/flange envelope. Frame cutout holes and exact drum spacing intentionally NOT modeled — solidworks-plan.md itself flags that spacing/cutout math as unresolved ("Adjust spacing to 450 mm frame"); this master does not invent a resolution. OpenSCAD render check: pass (openscad -o STL, exit 0); flat-blank-height cross-check echoes 131.48mm vs flat-pattern-checklist.md's 131.5mm. |

## Step 0 Retrieval Notes

- `qmd search "tunable-snare-frame-array" -c instrument-builds` returned no results.
- No prior build-packet entries exist in the instrument-builds collection for this instrument.
- Existing README, design.md, parameters.csv, and agent-record.md were read directly from the repo to ground all authority classifications.

## Promotion Rule

Add future rows when a real CAD, drawing, creative, CNC, Wolfram, or measurement
session creates or modifies an artifact. A future row may use `fabrication` only
when the output traces to reviewed CAD/DXF/design-table data or measured
prototype evidence and the artifact is also promoted in
`visual-output-register.csv`.
