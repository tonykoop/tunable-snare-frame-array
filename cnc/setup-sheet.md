<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CNC / Plasma Setup Sheet — Tunable Snare Frame Array

## Plasma Cutter Setup (Hypertherm 45XP or similar)

| Setting | Value |
|---------|-------|
| Material | Cold-rolled steel (CRS) |
| 1.0 mm stock amperage | 25–30 A |
| 1.5 mm stock amperage | 35–40 A |
| Cut speed 1.0 mm | 60–70 IPM |
| Cut speed 1.5 mm | 45–55 IPM |
| Kerf allowance | 1.5 mm (add 0.75 mm each side of cut line) |
| Air pressure | 65–70 PSI |
| Tip | Fine-cut consumable set |

**DXF Setup**: Load `drawings/frame_flat_blank.dxf` into Hypertherm CAM or SheetCam. Assign cut layer to `CUT`; verify all circle cut-outs and slot holes are on cut layer. Run toolpath simulation before cutting.

## Slip-Roll Setup (Jet R-3 or Di-Acro 12")

| Shell | Target OD | Starting Roll Gap |
|-------|-----------|------------------|
| Shell C | 152 mm | ~180 mm gap setting |
| Shell B | 203 mm | ~230 mm gap setting |
| Shell A | 254 mm | ~280 mm gap setting |

**Process**: Feed blank narrow edge first (60/50/40 mm edge = shell height). Roll at mid-pressure; re-check OD with calipers after each pass. Adjust bottom roll pinch to tighten or loosen radius. Final pass should overshoot ~2 mm; butt edges together and tack-weld to maintain OD.

## Brake Press Setup

| Bend | Part | Die | Punch | Stroke |
|------|------|-----|-------|--------|
| FRM-B01 | Mounting frame top flange | V-die 8mm | Standard | 90° |
| FRM-B02 | Mounting frame bottom flange | V-die 8mm | Standard | 90° |
| LUG-EAR | Lug ear base tab | V-die 8mm | Standard | 90° |

**Note**: Brake bends in 1.5 mm CRS. Die opening should be 6–8× material thickness = 9–12 mm V-die. Use 8 mm V-die if available.
