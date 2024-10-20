; When using a macro as custom gcode, do not use G, M, N or T as parameters in a custom 'G' gcode file
; param.A is the first layer bed temperature
; param.B is filament type
; param.c is first layer temperature
; param.D is the nozzle diameter the model was sliced for
; param.E is the first layer min X
; param.F is the first layer max X
; param.H is the first layer min Y
; param.J is the first layer max Y

set global.Cancelled = false                           ; reset the cancelled global value to false

set global.slicerBedTemp = param.A                     ; this updates the global variable slicerBedTemp to be equal to param.A
set global.slicerHotendTemp = param.C                  ; this updates the global variable slicerHotendTemp to be equal to param.C

if global.nozzleDiameterInstalled != param.D           ; this checks the gcode to ensure it matches the nozzle size installed in the printer
	abort "This gcode is for a different nozzle diameter" ; abort the gcode as the nozzle size doesn't match

if global.slicerBedTempOverride == 0                   ; check whether the bed temperature should be overriden
	M190 S{param.A}                                       ; set Bed Temperature to whatever is set in slicer
else
	M190 S{global.slicerBedTempOverride}                  ; set bed temperature to the override temperature set in btncmd instead

if param.B = "ABS" || param.B = "ASA"
	if !global.soakTimeOverride & global.soakTime != 0    ; check whether the chamber temperature soak time should be overriden
		M98 P"start_after_delay.g" S{global.soakTime}        ; chamber Soak

if global.Cancelled = true                             ; allows print to be cancelled at this point
	M291 P"Print has been cancelled" S0 T3
		G4 S3
		abort "Print cancelled."
else  
	G28                                                   ; home the printer
	M98 P"0:/macros/szp.g"
	
if global.Cancelled = true                             ; allows print to be cancelled at this point
	M291 P"Print has been cancelled" S0 T3
	G4 S3
	abort "Print cancelled."


if global.slicerHotendTempOverride == 0                ; check whether the hotend temperature should be overriden
	M568 P0 S{param.C} A2                                 ; set hotend Temperature to whatever is set in slicer
else
	M568 P0 S{global.slicerHotendTempOverride} A2         ; set hotend temperature to the override temperature set in btncmd instead
M116 P0                                                ; wait for this temperature to be reached

M83
G1 X3 Y10 F3000
G1 Z0.3 F240
G92 E0                                                 ;zero the extruded length again
G1 Y190 E15.0 F1500.0                                  ; intro line
G1 X3.4 F5000
G1 Y10 E30 F1200.0                                     ; intro line
G92 E0                                                 ;zero the extruded length again
M117 Printing...