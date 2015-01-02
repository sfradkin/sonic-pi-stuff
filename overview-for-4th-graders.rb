# Welcome to Sonic Pi v2.0

comment do
  2.times do
    with_synth :tb303 do
      use_synth_defaults cutoff: rrand(50, 120)
      with_fx :echo do
        play 60
        sleep 1
        play 59
        sleep 1
      end
    end
  end
end

comment do
live_loop :chords do
  play chord :c4, :major
  sleep 1
end
end

comment do
live_loop :choose_chord do
  play choose(chord :b3, :major7)
  sleep 1
end
end

comment do
live_loop :amen do
  sample :loop_amen, rate: 1
  sleep sample_duration :loop_amen, rate: 1
end
end

comment do
#4.times do
live_loop :bass_beat do
  sync :syncer
  sample :drum_bass_hard
  sleep 1
  sample :drum_bass_hard
  sleep 1
  sample :drum_bass_hard
  sleep 1
  sample :drum_bass_hard
  sleep 1
end
end

comment do
live_loop :snare_beat do
  sync :syncer
  sleep 0.5
  sample :drum_snare_soft
  sleep 1
  sample :drum_snare_soft
  sleep 1
  sample :drum_snare_soft
  sleep 1
  sample :drum_snare_soft
end
end

comment do
live_loop :syncer do
  sleep 4
end
end
