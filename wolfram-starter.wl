(* SPDX-License-Identifier: CERN-OHL-W-2.0 *)
(* Tunable Snare Frame Array — membrane acoustic model. First-order concept only. *)

ClearAll["Global`*"];

(* Physical constants *)
alpha01 = 2.4048;   (* First zero of Bessel J_0 — mode (0,1) *)
sigmaHead = 0.18;   (* Remo Ambassador Mylar area density, kg/m^2 — nominal *)

(* Membrane fundamental: f = (alpha01 / (2*Pi*r)) * Sqrt[T/sigma] *)
membraneFundamental[radiusM_, tensionNm_] :=
  (alpha01 / (2 * Pi * radiusM)) * Sqrt[tensionNm / sigmaHead];

(* Required tension to hit target frequency *)
requiredTension[radiusM_, targetHz_] :=
  sigmaHead * (targetHz * 2 * Pi * radiusM / alpha01)^2;

(* Drum family — nominal radii use standard Remo head sizes *)
drums = {
  <|"id" -> "DrumA", "label" -> "10-inch (250mm)", "radiusM" -> 0.127,
    "targetHz" -> 146.8, "targetNote" -> "D3"|>,
  <|"id" -> "DrumB", "label" -> "8-inch (200mm)",  "radiusM" -> 0.1015,
    "targetHz" -> 220.0, "targetNote" -> "A3"|>,
  <|"id" -> "DrumC", "label" -> "6-inch (150mm)",  "radiusM" -> 0.076,
    "targetHz" -> 293.7, "targetNote" -> "D4"|>
};

(* Compute required tensions *)
drumData = Map[
  Function[d,
    t = requiredTension[d["radiusM"], d["targetHz"]];
    f_check = membraneFundamental[d["radiusM"], t];
    Association[d,
      "tensionRequired_Nm" -> t,
      "freqCheck_Hz" -> f_check,
      "tensionPct_ofBurst" -> 100.0 * t / 3000.0
    ]
  ],
  drums
];

(* Print summary table *)
Print["=== Tunable Snare Frame Array — Acoustic Model ===\n"];
Do[
  d = drumData[[i]];
  Print[d["label"], " (", d["targetNote"], " = ", d["targetHz"], " Hz)"];
  Print["  Required tension : ", NumberForm[d["tensionRequired_Nm"], {5,0}], " N/m"];
  Print["  Frequency check  : ", NumberForm[d["freqCheck_Hz"], {5,1}], " Hz"];
  Print["  % of burst spec  : ", NumberForm[d["tensionPct_ofBurst"], {4,1}], " %"];
  Print[],
  {i, Length[drumData]}
];

(* Tension sweep for DrumB (highest required tension — critical check) *)
Print["\n=== Drum B (8-inch) Tension Sweep ==="];
tensionSweep = Table[
  {t, membraneFundamental[0.1015, t]},
  {t, 500, 3000, 250}
];
Print[TableForm[tensionSweep,
  TableHeadings -> {None, {"Tension N/m", "Freq Hz"}}]];

(* Inharmonic partial ratios for membrane *)
Print["\n=== Membrane Inharmonic Partials (ratio to fundamental) ==="];
Print["Mode (1,1) : 1.594x"];
Print["Mode (2,1) : 2.136x"];
Print["Mode (0,2) : 2.295x"];
Print["(Compare: harmonic series would be 2.0x, 3.0x, 4.0x)"];
