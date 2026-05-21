<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Fabrication Plan — Tunable Snare Frame Array

## Maker Nexus Tools Required

| Tool | Use |
|------|-----|
| Plasma cutter (Hypertherm 45XP or similar) | Frame flat blank + lug ears |
| Slip-roll (e.g. Jet R-3 or Di-Acro 12") | Roll shell cylinders |
| TIG welder (Miller Dynasty or similar) | Butt-weld cylinder seams |
| Angle grinder + flap disc | Seam flush-grind + deburr |
| Drill press | Lug holes in shells |
| Brake press | Frame flange bends |
| Belt grinder / file | Bearing edge chamfer |
| Drum key, chromatic tuner | Head tensioning + pitch verification |

---

## Step-by-Step Sequence

### Stage 1 — Cut Blanks

1. Mark stock 1.0 mm CRS for three shell blanks; cut with plasma or shear:
   - Shell A: 798.0 mm × 60.0 mm
   - Shell B: 637.7 mm × 50.0 mm
   - Shell C: 477.5 mm × 40.0 mm
2. Mark stock 1.5 mm CRS for frame: 450.0 mm × 131.5 mm; plasma-cut three circular holes:
   - Drum A hole: ⌀256 mm at x=60, y=65.75 (center of 131.5 mm frame)
   - Drum B hole: ⌀205 mm at x=185, y=65.75
   - Drum C hole: ⌀154 mm at x=310, y=65.75
   - Also plasma: 12× M5 clearance holes (⌀5.5 mm) around each circle at ±20 mm from edge
3. Plasma 16× lug ear blanks from 1.5 mm CRS: 60 mm × 40 mm each. Mark fold line at 15 mm.
4. Deburr all plasma-cut edges with file/grinder.

### Stage 2 — Form Cylinders

5. Slip-roll Shell C (smallest) first as coupon. 3-roller setup; pass blank through at progressive settings until ⌀152 mm OD achieved. Measure OD with calipers or wrap tape measure.
   - Overshoot by 1–2 mm then spring back; iterate.
6. Check seam alignment: butt edges should meet flush within 0.5 mm gap.
7. TIG butt-weld seam: 1.0 mm CRS, 40A, DCEN, ER70S-6 filler. Tack 3 spots, then run seam bottom to top. Avoid warping — short passes, let cool.
8. Grind seam flush: flap disc until OD is smooth. Confirm OD within ±0.5 mm of nominal.
9. Repeat for Shell B, then Shell A (each progressively larger radius is easier to roll).

### Stage 3 — Bearing Edge + Lug Holes

10. File or belt-grind 45° × 1.0 mm chamfer on top rim OD of each shell. Run finger along edge — zero sharp burr acceptable. This is the head bearing edge.
11. Drill 4× (Shell C) or 6× (Shell A, B) M5 clearance holes (⌀5.5 mm) at 15 mm from top rim using drill press + V-block fixture to hold cylinder. Mark positions with transfer punch.
12. Deburr all holes inside and outside with countersink.

### Stage 4 — Form Frame

13. Brake press: bend top flange (20 mm) 90° inward at y = 25.74 mm from top edge of blank.
14. Brake press: bend bottom flange (20 mm) 90° inward at y = 25.74 mm from bottom edge.
15. Check flanges square with combination square. Both flanges fold toward drum-mounting side.
16. Fold 16× lug ear blanks: 90° bend at 15 mm mark (brake or vise + block). Base tab is 15 mm × 60 mm; ear body is 25 mm × 60 mm.

### Stage 5 — Weld Lug Ears to Shells

17. Position 4 ears (per Shell C) or 6 ears (per Shell A, B) on shell OD at lug hole positions. Align ear base tab with lug hole. Tack-weld.
18. Verify ear angle perpendicular to shell axis using square.
19. Complete weld all ears.

### Stage 6 — Assembly

20. Drop each shell into its frame cut-out. Lug ears pass through frame from drum side; M5 bolts secure from frame side.
21. Install counter-hoop and drum head: seat Remo Ambassador 6/8/10" onto shell rim; place counter-hoop; install tension rods through counter-hoop → lug → rod.
22. Finger-tighten all rods. Equalize with cross-tension pattern (see `tuning-notes.md`).
23. Install snare mechanism: snare wires lay across batter head bottom edge; thumb-wheel tensioner mounts to lug ear or dedicated bracket.

### Stage 7 — Tune and Validate

24. Tension drums to target frequencies (see `tuning-notes.md` and `validation.csv`).
25. Verify all acceptance targets in `validation.csv`.
26. Mark lug rod extension with paint pen at target tension for repeatability.

---

## Material Stock Required

- 1.0 mm CRS sheet: 1× sheet 300 × 900 mm covers Shell A + B + C blanks
- 1.5 mm CRS sheet: 1× sheet 500 × 500 mm covers frame + lug ear stock
- ER70S-6 TIG rod, flap disc, M5 hardware

---

## Inspection Gates

| Gate | Criteria | Point |
|------|---------|-------|
| Shell OD | ±0.5 mm of nominal after weld + grind | After Stage 2 |
| Seam flush | < 0.5 mm proud | After Stage 2 |
| Bearing edge | No sharp burrs; smooth 45° chamfer | After Stage 3 |
| Lug holes | ±0.5 mm position; no raised burrs inside shell | After Stage 3 |
| Frame flatness | < 1 mm bow over 450 mm span | After Stage 4 |
| Head seating | Head seats with no visible gap around rim | After Stage 6 |
| Pitch | Center fundamental within ±50 cents of target | After Stage 7 |
