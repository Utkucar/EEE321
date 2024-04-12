notename = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"];

song = ["E", "D#", "E", "D#", "E", "B", "D", "C", "A"];

for k1 = 1:length(song)
    idx = strcmp(song(k1), notename);
    songidx(k1) = find(idx);
end

dur = 0.38 * 8192;
songnote = [ ];

for k1 = 1:length(songidx)
    songnote = [songnote; [notecreate(songidx(k1), dur) zeros(1, 75)]'];
end

sound(songnote, 8192);
%audiowrite('hasan_utku_uçar_part6.wav', songnote, 8192);

function [note] = notecreate(frq_no, dur)
    note = sin(2 * pi * [1:dur] / 8192 * (440 * 2 .^((frq_no - 1) / 12)));
end