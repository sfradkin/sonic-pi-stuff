# Sonic Pi 2.11
# Scott Fradkin, 07-13-2016

# wrote this bit to work by
# nice vibes for working, i thought

r = (ring chord(:c3, :minor, num_octaves: 2),
     chord(:fs3, :minor, num_octaves: 2),
     chord(:eb2, :minor, num_octaves: 2),
     chord(:d2, :minor, num_octaves: 2),
     chord(:b3, :minor, num_octaves: 2),
     chord(:b2, :minor, num_octaves: 2),
     chord(:cs2, :minor, num_octaves: 2),
     chord(:bb2, :minor, num_octaves: 2))

live_loop :ambi do
  with_synth :dark_ambience do
    play r.choose, attack: 2, sustain: 8, decay: 2, release: 2, amp: 2
  end
  sleep 12
end

nn = chord :eb2, :minor, num_octaves: 4

live_loop :blips, sync: :ambi do
  rr = rrand_i(1, 5)
  with_fx :echo, phase: 0.25, decay: 8 do
    24.times do
      with_synth :prophet do
        play nn.choose, release: 0.25, on: spread(rr, 14).tick, amp: 0.4
        sleep 0.5
      end
    end
  end
end

live_loop :noisy, sync: :ambi do
  with_synth :bnoise do
    play [:e1, :e0, :c1, :c0].choose, amp: 0.1, attack: 2, decay: 2, release: 2, sustain: [8, 4, 2, 1].choose
    sleep [1, 2, 4, 8].choose
  end
end
