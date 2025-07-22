# Set the battery charge limit
charge-limit LIMIT:
    #!/usr/bin/bash
    echo Applying a limit of {{LIMIT}}% to the battery
    echo {{LIMIT}} > /sys/class/power_supply/BAT0/charge_control_end_threshold
    
