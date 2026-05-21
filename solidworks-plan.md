<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# SolidWorks Plan — Tunable Snare Frame Array

## Part List

| Part | File | Type |
|------|------|------|
| Shell A (10″) | `cad/shell_A_254mm.sldprt` | Sheet metal cylinder |
| Shell B (8″) | `cad/shell_B_203mm.sldprt` | Sheet metal cylinder |
| Shell C (6″) | `cad/shell_C_152mm.sldprt` | Sheet metal cylinder |
| Mounting frame | `cad/mounting_frame.sldprt` | Sheet metal flat + bends |
| Lug ear (×3 designs) | `cad/lug_ear.sldprt` | Small bracket |
| Assembly | `cad/snare_array_asm.sldasm` | Top-level assembly |

---

## Cylinder Shell Modeling (Shell A — same pattern for B, C)

1. **New Part → Sheet Metal**; thickness = 1.0 mm; K-factor = 0.44; bend radius = 1.5 mm
2. **Base Flange**: rectangle 798.0 mm × 60.0 mm (Drum A flat blank)
   - 798.0 = π × 254 mm (circumference of 254 mm OD cylinder)
3. **Convert to rolled cylinder**:
   - SolidWorks Sheet Metal doesn't natively roll into a cylinder from Base Flange.
   - Workflow: sketch a cylinder body (254 mm OD × 60 mm tall) → shell to 1.0 mm → convert to sheet metal (K = 0.44, thickness 1.0 mm) → flatten for DXF.
   - Alternatively: use Weldments or Forming Tools approach — model as a rolled tube, annotate seam as a cut edge.
4. **Seam edge**: mark one edge with `WELD_SEAM` annotation; this is the butt-TIG seam.
5. **Bearing edge**: apply 45° chamfer 1.0 mm depth to both OD rim edges (upper bearing edge for head; lower rim just deburred).
6. **Lug holes**: 3× or 4× equally spaced M5 clearance holes (⌀5.5 mm) at 15 mm from top rim (above bearing edge). Pattern by circular sketch.
7. **Flat pattern** → Export DXF: cut on layer `CUT`, no bend lines (no bends in cylinder — it's rolled flat).

## Mounting Frame Modeling

1. **New Part → Sheet Metal**; thickness = 1.5 mm; K-factor = 0.44; bend radius = 3.0 mm
2. **Base Flange**: flat blank 450.0 mm × 131.5 mm
   - 131.5 mm = 20 (flange) + 5.74 (BA) + 80 (web) + 5.74 (BA) + 20 (flange)
3. **Edge Flange**: top and bottom edges → 90° flanges, 20 mm, fold inward (toward drum side)
4. **Cut-outs**: three circles on the 80 mm web:
   - Drum A: ⌀256 mm center cut (2 mm clearance over head counter-hoop OD)
   - Drum B: ⌀205 mm center cut
   - Drum C: ⌀154 mm center cut
   - Spacing: drum centers at x = 60, 185, 300 mm from left edge (gaps: 60 + 127 = 187mm center-left, 185mm center-mid, etc.)
   - Verify: 127 + 50 + 101.5 + 40 + 76 = 394.5 mm for 3 radii + 2 gaps. Adjust spacing to 450 mm frame.
5. **Lug ear holes**: 4× M5 clearance per drum circle, at 3, 6, 9, 12 o'clock positions on each circle OD + 20 mm
6. **Mounting feet**: optional — 4× M6 slots at frame corners for table clamp or stand pole.
7. **Global variables** (SolidWorks equations):
   - `"DrumA_OD" = 254`, `"DrumB_OD" = 203`, `"DrumC_OD" = 152`
   - `"FrameWidth" = 450`, `"WebHeight" = 80`, `"FlangeHeight" = 20`

## Equation-Driven Design

Drive all cut-out diameters and drum center positions from global variables. Changing `DrumA_OD` should propagate to cut-out diameter + lug hole pattern automatically.

## Assembly

1. Mate each shell into its frame cut-out (concentric + coincident face).
2. Add lug ear instances to shell OD positions.
3. Mates: concentric to shell OD; fastened via M5 screws through frame.
4. Add drum head placeholders (disc at top of each shell).
