# Welcome to Sonic Pi v2.0

# Play random notes by midi number
# sleep for any number of seconds or fractions of seconds
play 60
sleep 1
play 50
sleep 5

# Play notes by actual note name and octave number
# Here's Twinkle Twinkle Little Star
play :c4
sleep 0.5
play :c4
sleep 0.5
play :g4
sleep 0.5
play :g4
sleep 0.5
play :a4
sleep 0.5
play :a4
sleep 0.5
play :g4
sleep 0.75
play :f4
sleep 0.5
play :f4
sleep 0.5
play :e4
sleep 0.5
play :e4
sleep 0.5
play :d4
sleep 0.5
play :d4
sleep 0.5
play :c4
sleep 0.75
play :g4
sleep 0.5
play :g4
sleep 0.5
play :f4
sleep 0.5
play :f4
sleep 0.5
play :e4
sleep 0.5
play :e4
sleep 0.5
play :d4
sleep 0.75
play :g4
sleep 0.5
play :g4
sleep 0.5
play :f4
sleep 0.5
play :f4
sleep 0.5
play :e4
sleep 0.5
play :e4
sleep 0.5
play :d4
sleep 0.75
play :c4
sleep 0.5
play :c4
sleep 0.5
play :g4
sleep 0.5
play :g4
sleep 0.5
play :a4
sleep 0.5
play :a4
sleep 0.5
play :g4
sleep 0.75
play :f4
sleep 0.5
play :f4
sleep 0.5
play :e4
sleep 0.5
play :e4
sleep 0.5
play :d4
sleep 0.5
play :d4
sleep 0.5
play :c4



comment do

  # loop N times just by choosing a number and adding .times and a block
  2.times do
    
    # add a block with a specific synth
    with_synth :tb303 do
    
      # let's randomly change the cutoff each time through the loop
      use_synth_defaults cutoff: rrand(50, 120)
      
      # add some fx... how about echo
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
