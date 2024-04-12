recObj = audiorecorder(8192, 16, 1);

recDuration = 10;
disp("Begin speaking.")
recordblocking(recObj,recDuration);
disp("End of recording.")

play(recObj);

audioData = getaudiodata(recObj);

audiowrite('ID_record.flac', audioData, 8192);