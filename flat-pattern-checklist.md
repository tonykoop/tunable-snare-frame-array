<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Flat-Pattern Checklist — Tunable Snare Frame Array

## DXF Naming Convention

| Part | DXF File | Units |
|------|----------|-------|
| Shell A (10″) | `drawings/shell_A_254mm_blank.dxf` | mm |
| Shell B (8″) | `drawings/shell_B_203mm_blank.dxf` | mm |
| Shell C (6″) | `drawings/shell_C_152mm_blank.dxf` | mm |
| Mounting frame flat | `drawings/frame_flat_blank.dxf` | mm |
| Lug ear | `drawings/lug_ear.dxf` | mm |

## Layer Scheme

| Layer | Purpose | Color |
|-------|---------|-------|
| `CUT` | Plasma/laser cut outline | Red |
| `BENDS` | Fold lines (frame flanges) | Blue |
| `ETCH` | Etch marks (lug hole centers, seam ref) | Green |
| `NOTES` | Non-cutting annotations | Black |

## Cylinder Blank Development

Circumference = π × OD; no bend allowance (rolling, not bending):

| Part | OD (mm) | Depth (mm) | Blank W (mm) | Blank H (mm) | Seam |
|------|---------|-----------|------------|------------|------|
| Shell A | 254 | 60 | 798.0 | 60.0 | Butt+TIG |
| Shell B | 203 | 50 | 637.7 | 50.0 | Butt+TIG |
| Shell C | 152 | 40 | 477.5 | 40.0 | Butt+TIG |

Roll direction: 60/50/40 mm dimension becomes the shell height; 798/638/478 mm wraps around.

Mark seam edge with etch line 2 mm from one short edge (alignment during rolling).

## Frame Flat Blank

| Dimension | Value | Notes |
|-----------|-------|-------|
| Flat blank width | 450.0 mm | Frame width, no bends in this direction |
| Flat blank height | 131.5 mm | = 20 + 5.74 + 80 + 5.74 + 20 (flanges + BA + web + BA + flanges) |
| Bend lines | at y = 25.74 mm and y = 105.76 mm from bottom edge | Define top/bottom flange fold |
| Material | 1.5 mm CRS | |
| K-factor | 0.44 | |
| Inside bend radius | 3.0 mm | |
| Bend allowance (each) | 5.74 mm | = π/2 × (3.0 + 0.44×1.5) = 5.74 mm |

## Tab-and-Slot Strategy

Cylinder shells: no tabs/slots — they are rolled and TIG butt-welded at seam. Weld seam runs full height of shell. Post-weld: round over seam with angle grinder, confirm OD is within ±0.5 mm of nominal.

Frame: no tabs/slots — flat plate with plasma-cut holes. Lug ears are separate weld-on brackets.

## Bearing Edge

After rolling and welding shells: file or machine a 45° chamfer × 1 mm depth on the top rim OD edge. This is the drum head bearing edge. Clean with fine file, remove all sharp burrs. Failure mode: sharp edge cuts through drum head.

## Coupon Tests Required

1. **Roll coupon**: 200 mm × 60 mm × 1.0 mm CRS — roll to 254 mm OD cylinder. Measure actual OD with calipers. Adjust blank width if OD drifts > 1 mm.
2. **Weld coupon**: TIG butt-weld two 50 mm × 60 mm × 1.0 mm CRS strips. Test seam flush. If seam proud > 0.5 mm, grind flat before bearing edge work.
3. **Frame bend coupon**: bend 90° in 1.5 mm CRS with 3 mm radius. Verify flange angle with square.
