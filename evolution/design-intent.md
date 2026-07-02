# Design Intent — tunable-snare-frame-array rev A

- Master CAD: `cad/tunable-snare-frame-array.scad` (sha256: 827722c7ed5bbfccc3cb07f178c27a4b68c70fcb8cf84483679f25fbc1086f06), driven by `parameters.csv` (sha256: e1d43284038be2fa18797bd949bf80dfad56ec63f3702a8946c492022cb44d1d)
- Function: Three graduated-diameter (250/200/150mm nominal) frame snare drums sharing one plasma-cut cold-rolled-steel mounting bracket, independently tensioned via standard lug hardware to produce a D3/A3/D4 (D-minor triad) pitch cluster. Bought Remo Ambassador heads (6"/8"/10") and bought snare wires (8-12 strand) via circular tensioned-membrane Bessel mode (0,1) acoustics.
- Environment: hand-percussion kit, tabletop or stand-mounted; each drum head carries an independent tension load (500-2500 N/m practical range) via its own lug hardware.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Drum A/B/C OD (standard) | 254 / 203 / 152 mm | matches Remo Ambassador catalog head sizes | head fit / pitch targets D3-A3-D4 | parameters.csv drum_*_od_standard (high confidence) |
| Drum A/B/C depth | 60 / 50 / 40 mm | proportional estimate | shell blank height, cavity volume | parameters.csv drum_*_depth (medium confidence) |
| Shell thickness | 1.0 mm CRS | K-factor 0.44, bend radius 1.5mm | formability + structure | parameters.csv shell_thickness_mm (high confidence) |
| Frame width / web height | 450 / 80 mm | flat blank 450 x 131.5mm | mounting bracket envelope | flat-pattern-checklist.md Frame Flat Blank (resolved) |
| Frame thickness | 1.5 mm CRS | K-factor 0.44, bend radius 3.0mm | bracket structural stiffness | parameters.csv frame_thickness_mm (high confidence) |
| Head tension target | 1600-2800 N/m per drum | burst spec ~3000 N/m (low confidence) | tuning range vs. head failure margin | parameters.csv head_tension_target_Nm / design.md acoustic model |

## Incidental (free for DFM)

- Frame corner/mounting-foot styling, exterior finish, lug-ear cosmetic shape beyond hole pattern.

## Must-nots (DFM may never violate)

- Frame cutout diameters and drum center spacing are UNRESOLVED in the source (solidworks-plan.md's own math check: "127 + 50 + 101.5 + 40 + 76 = 394.5 mm for 3 radii + 2 gaps. Adjust spacing to 450 mm frame" — an open TODO) — do not fabricate cutouts from this master; a reviewed CAD session must resolve fit-up first.
- Shell wall thickness stays ≥1.0 mm CRS — thinner risks losing the Maker Nexus slip-roll/weld structural margin (risks.md).
- Bearing edge (45° chamfer, 1mm depth) must be applied post-weld before head mounting — sharp rim edges cut through drum heads (flat-pattern-checklist.md "Bearing Edge").
- Do not weld shell seams before the roll coupon test confirms OD within ±1mm of nominal (flat-pattern-checklist.md "Coupon Tests Required").

## Material intent

- Preferred: 1.0 mm CRS (20-gauge) shells, 1.5 mm CRS (16-gauge) mounting frame, Remo Ambassador Mylar heads (bought), 8-12 strand bought snare wires, TIG butt-weld seams.
- Acceptable subs: none recorded beyond bought-hardware equivalents.
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable.
