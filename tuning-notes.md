<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Tuning Notes — Tunable Snare Frame Array

## Pitch Set Rationale

Three pitches: D3 (146.8 Hz), A3 (220.0 Hz), D4 (293.7 Hz).

- D3 → A3: perfect 5th (frequency ratio 3:2 = 1.5×)
- A3 → D4: perfect 4th (frequency ratio 4:3 ≈ 1.333×)
- D3 → D4: octave (frequency ratio 2:1)

This yields a D–A–D open-tuned trio. Players can re-tune to any 3-note set (blues minor 3rd + 5th, chromatic cluster, sus4) by adjusting individual head tensions.

## Membrane Physics

Circular membrane fundamental: `f₀₁ = (2.4048 / (2πr)) · √(T/σ)`

Solving for required tension to hit target pitch:

```
T_required = σ · (f₀₁ · 2πr / 2.4048)²
```

At σ = 0.18 kg/m²:

| Drum | r (m) | f target | T required (N/m) |
|------|--------|----------|-----------------|
| A (10″) | 0.127 | 146.8 Hz | 1160 N/m |
| B (8″) | 0.1015 | 220.0 Hz | 2540 N/m |
| C (6″) | 0.076 | 293.7 Hz | 2250 N/m |

Drum B (8″, A3) requires the highest tension (~2540 N/m). This approaches but does not exceed the Remo Ambassador burst spec estimate (~3000 N/m). Verify with first prototype.

## Tuning Mechanism

Standard drum lug hardware — 6-lug on 10″ and 8″ drums, 4-lug on 6″ drum. Tension rods (M5 or 8-32) engage counter-hoop anchored lugs welded to shell exterior.

Procedure:
1. Finger-tighten all rods to seat head.
2. Cross-tension pattern (opposite lugs): ¼-turn increments.
3. Tap near each lug and compare pitch — equalize before checking center.
4. Strike center; read on chromatic tuner. Target pitch ± 50 cents is Stage 1 acceptance.
5. Detune → retighten 3× for head seating before final measurement.

## Harmonic Series

Circular membrane modes above the fundamental:
- Mode (1,1): 1.594 × f₀₁
- Mode (2,1): 2.136 × f₀₁
- Mode (0,2): 2.295 × f₀₁

These are inharmonic (not integer multiples). The drum tone character — that slightly untuned metallic quality — comes from these inharmonic partials. The snare buzz masks the higher partials and adds broadband noise, traditional to snare drums.

## Snare Tuning

Snare wires rest against the batter-side head (or bottom resonant head if double-headed, though this design is single-head). A thumb-wheel tensioner controls snare contact pressure:
- Full release: clean membrane tone, jazz-brush character
- Light contact: slight buzz, add-on shimmer
- Full contact: classic snare rattle

Snare wire pitch is not adjustable separately; it tracks the head fundamental.

## Alternate Tuning Sets

| Set name | Drum A | Drum B | Drum C |
|---------|--------|--------|--------|
| D–A–D (default) | D3 | A3 | D4 |
| Blues cluster | D3 | F3 | A3 |
| Chromatic leading | D3 | Eb3 | E3 |
| Open 5th power | C3 | G3 | C4 |

Head σ uncertainty (±20%) shifts all targets; tune by ear against tuner reference.
