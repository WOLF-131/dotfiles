sleep 2s; sudo chvt 7; sleep 5s; DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xwd -root -out ~/lightdm.xwd; convert ~/lightdm.xwd ~/lightdm.png; rm ~/lightdm.xwd