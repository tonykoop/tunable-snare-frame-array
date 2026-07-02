// Tunable Snare Frame Array parametric master — three shell envelopes +
// mounting frame envelope.
//
// Authority: pending_measurement. NOT fabrication authority until reviewed
// against a formed/welded prototype (see visual-output-register.csv V5-REG-027
// and cad/mcp-session-log.md).
//
// SCOPE: this master models (a) the three rolled-cylinder shell envelopes
// (Drum A/B/C, OD + depth only — wall-thickness offset, weld seam, bearing-
// edge chamfer, and lug-hole pattern are NOT modeled, see flat-pattern-
// checklist.md), and (b) the mounting-frame flat-blank envelope (web +
// folded flanges, per flat-pattern-checklist.md's resolved bend geometry).
//
// EXPLICITLY OUT OF SCOPE: the frame's per-drum cutout holes and exact drum
// center spacing. solidworks-plan.md itself flags this as unresolved — its
// own math check reads "127 + 50 + 101.5 + 40 + 76 = 394.5 mm for 3 radii +
// 2 gaps. Adjust spacing to 450 mm frame" (an open TODO), and the plan's
// stated cutout diameters (256/205/154 mm) do not fit inside the stated
// 80 mm web height as literal full circles. Rather than invent a resolution
// to that open contradiction, the three shells below are positioned at the
// plan's literal reference x-positions (60/185/300 mm) for layout reference
// ONLY — this is not cutout/fabrication authority. Fit-up must be resolved
// by a reviewed CAD session before L3.
//
// Dimension sources (do not edit values without updating the source record):
//   - drum_*_od_standard, drum_*_depth, shell_thickness_mm: parameters.csv
//   - frame web/flange/thickness: flat-pattern-checklist.md "Frame Flat Blank"
//     (450.0mm width, 131.5mm flat blank height = 20 + 5.74 + 80 + 5.74 + 20)
//   - drum reference x-positions (60/185/300mm): solidworks-plan.md
//     "Mounting Frame Modeling" step 4 (explicitly flagged unresolved there)
//
// Units: millimeters.

/* [Shell envelopes — parameters.csv, Remo Ambassador catalog ODs] */
drum_a_od_mm   = 254; // parameters.csv drum_a_od_standard (10in)
drum_a_depth_mm = 60; // parameters.csv drum_a_depth
drum_b_od_mm   = 203; // parameters.csv drum_b_od_standard (8in)
drum_b_depth_mm = 50; // parameters.csv drum_b_depth
drum_c_od_mm   = 152; // parameters.csv drum_c_od_standard (6in)
drum_c_depth_mm = 40; // parameters.csv drum_c_depth
shell_thickness_mm = 1.0; // parameters.csv shell_thickness_mm (documented,
                           // not modeled as a wall offset — see SCOPE above)

/* [Mounting frame — flat-pattern-checklist.md "Frame Flat Blank", resolved] */
frame_width_mm      = 450;  // flat-pattern-checklist.md
frame_web_height_mm = 80;   // flat-pattern-checklist.md (web only, formed part)
frame_flange_mm     = 20;   // flat-pattern-checklist.md (each end, formed 90deg)
frame_thickness_mm  = 1.5;  // parameters.csv frame_thickness_mm

/* [Reference layout only — solidworks-plan.md, NOT cutout authority] */
drum_a_x_mm = 60;
drum_b_x_mm = 185;
drum_c_x_mm = 300;

$fn = 96;

module drum_shell(od, depth, x) {
  translate([x, frame_thickness_mm, frame_web_height_mm / 2])
    rotate([-90, 0, 0])
      cylinder(h = depth, d = od);
}

module mounting_frame() {
  // Web: flat panel, width x web_height, thickness along Y.
  cube([frame_width_mm, frame_thickness_mm, frame_web_height_mm]);
  // Bottom flange, folded 90deg toward +Y (drum side).
  translate([0, 0, 0])
    cube([frame_width_mm, frame_flange_mm, frame_thickness_mm]);
  // Top flange, folded 90deg toward +Y (drum side).
  translate([0, 0, frame_web_height_mm - frame_thickness_mm])
    cube([frame_width_mm, frame_flange_mm, frame_thickness_mm]);
}

module snare_array_assembly() {
  mounting_frame();
  drum_shell(drum_a_od_mm, drum_a_depth_mm, drum_a_x_mm);
  drum_shell(drum_b_od_mm, drum_b_depth_mm, drum_b_x_mm);
  drum_shell(drum_c_od_mm, drum_c_depth_mm, drum_c_x_mm);
}

snare_array_assembly();

// Render-time check against flat-pattern-checklist.md flat blank height:
// 20 + 5.74 + 80 + 5.74 + 20 = 131.5mm (bend-allowance not modeled in the
// formed-part envelope above; echoed here for cross-reference only).
echo(str("flat_blank_height_check_mm=", 20 + 5.74 + 80 + 5.74 + 20));
echo("NOTE: frame cutouts + exact drum spacing are unresolved in source docs (see SCOPE) — not modeled.");
