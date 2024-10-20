while global.daemon
    while global.heightchanges && state.status == "processing"
        if move.axes[2].machinePosition > 0.2
            M220 S100
            M568 P0 S250
        if move.axes[2].machinePosition > 5
            M220 S150
            M568 P0 S255
            M106 P0 S255
            M106 P4 S255
            M106 P5 S255
        if move.axes[2].machinePosition > 10
            M220 S200
            M568 P0 S260
            M106 P0 S255
            M106 P4 S255
            M106 P5 S255
        if move.axes[2].machinePosition > 15
            M220 S250
            M568 P0 S265
            M106 P0 S255
            M106 P4 S255
            M106 P5 S255
        if move.axes[2].machinePosition > 20
            M220 S300
            M568 P0 S270
            M106 P0 S255
            M106 P4 S255
            M106 P5 S255
        if move.axes[2].machinePosition > 25
            M220 S350
            M568 P0 S275
            M106 P0 S255
            M106 P4 S255
            M106 P5 S255
        if move.axes[2].machinePosition > 30
            M220 S400
            M568 P0 S280
            M106 P0 S255
            M106 P4 S255
            M106 P5 S255
        G4 S2