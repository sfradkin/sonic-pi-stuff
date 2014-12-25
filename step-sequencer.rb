# VERY rudimentary step sequencer

BPM = 92.0
TICKS_PER_BEAT = 8.0

BEAT = 60.0 / BPM

TICK = BEAT / TICKS_PER_BEAT

BARS_PER_PATTERN = 4.0

puts BEAT
puts TICK

use_synth :fm
use_synth_defaults res: 0.4, attack: 0.05, sustain: 0.07, decay: 0.03, release: 0.04, cutoff: 120

define :run_sequence_sample do |patterns|

  patterns.each do |a_pattern|
    sync :sync_beat
    a_pattern.each do |pat_item|
      sample pat_item
      sleep TICK
    end
  end

end

define :run_sequence_note do |patterns|

  patterns.each do |a_pattern|
    sync :sync_beat
    a_pattern.each do |pat_item|
      play pat_item
      sleep TICK
    end
  end

end

pat1 = [[:drum_heavy_kick, nil, nil, nil, nil, nil, nil, nil, :drum_heavy_kick, nil, nil, nil, nil, nil, nil, nil, :drum_heavy_kick, nil, nil, nil, nil, nil, nil, nil, :drum_heavy_kick, nil, nil, nil, nil, nil, nil, nil],
        [:drum_heavy_kick, nil, :drum_heavy_kick, nil, nil, nil, nil, nil, :drum_heavy_kick, nil, nil, nil, nil, nil, nil, nil, :drum_heavy_kick, nil, nil, nil, nil, nil, nil, nil, :drum_heavy_kick, nil, nil, nil, nil, nil, nil, nil]]
pat2 = [[nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, :drum_snare_soft, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, :drum_snare_soft, nil]]
#pat2 = [[]]
pat3 = [[nil, nil, nil, :drum_tom_lo_soft, nil, nil, nil, nil,
         nil, nil, nil, nil, nil, nil, nil, nil,
         :drum_tom_lo_soft, nil, nil, nil, :drum_tom_lo_soft, nil, nil, nil,
         nil, nil, nil, nil, nil, nil, nil, nil]]
pat4 = [[nil, :drum_cymbal_closed, nil, nil, nil, nil, nil, nil,
         nil, :drum_cymbal_closed, nil, nil, nil, :drum_cymbal_closed, nil, nil,
         nil, :drum_cymbal_closed, nil, nil, nil, nil, nil, nil,
         nil, :drum_cymbal_closed, nil, nil, nil, :drum_cymbal_closed, nil, nil]]

all_sample_patterns = [pat1, pat2, pat3, pat4]
patnum = 1

all_sample_patterns.each do |pattern|
  live_loop :"pat#{patnum}" do
    run_sequence_sample pattern
  end
  patnum = patnum + 1
end

notepat1 = [[:e2, nil, :e2, nil, :a3, nil, nil, nil, nil, :g2, nil, nil, :e3, nil, :e2, nil, nil, nil, :a2, nil, :cs2, nil, :d2, nil, nil, nil, :d3, nil, nil, :c2, nil, nil]]
notepat2 = [[nil, nil, :a4, nil, :f3, nil, :cs4, nil, nil, nil, :g5, nil, :c4, nil, :bf4, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil]]

all_note_patterns = []

notepatnum = 1

all_note_patterns.each do |pattern|
  live_loop :"notepat#{notepatnum}" do
    run_sequence_note pattern
  end
  notepatnum = notepatnum + 1
end


live_loop :syncer do
  cue :sync_beat
  sleep BEAT * BARS_PER_PATTERN
end