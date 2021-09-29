# Close up the USB sound card before suspend
sysctl hw.snd.default_unit=0

# Close any programs still using the sound card
while fstat | grep dsp3 2>&1; do
   fstat | grep dsp3 | cut -w -f 3 | while read pid;
      do kill -15 "$pid"
   done
done
while [ "$(ls -l /dev | grep -c dsp3)" -gt 1 ]; do
   sleep 1
done
