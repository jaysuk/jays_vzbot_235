G28 Z                                                               ; Home Z

G30 P0 X30 Y30 Z-99999 ; probe near an adjusting screw              ; Front left screw
G30 P1 X30 Y200 Z-99999 ; probe near an adjusting screw             ; Front right screw
G30 P2 X200 Y200 Z-99999 ; probe near an adjusting screw             ; Rear left screw
G30 P3 X200 Y30 Z-99999 S4 ; probe near an adjusting screw         ; Rear right screw

G28 Z                                                               ; Home Z