# Full code for very quick overview of Sonic Pi for 4th graders
# Intent is to build these samples incrementally to show kids some of the Sonic Pi features and eventually build up a track

comment do
  2.times do

    with_synth :tb303 do
      with_fx :echo do
        play 60
        sleep 1
        play 59
        sleep 1
      end
    end
  end
end

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

live_loop :syncer do
  sleep 4
end
