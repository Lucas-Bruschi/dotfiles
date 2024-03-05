#!/bin/python

import subprocess
import re
import json

sensor_output = subprocess.check_output(['sensors'], text=True)

pattern = re.compile(r'Core (\d+):[^\d]*([\+\-\d\.]+)°C')
package_temp_pattern = re.compile(r'Package id 0:[^\d]*([\+\-\d\.]+)°C')

matches = pattern.findall(sensor_output)
package_temp_match = package_temp_pattern.search(sensor_output)

package_temp = package_temp_match.group(1) if package_temp_match else None

core_temps = []

for match in matches:
    core_name = f"Core {match[0]}"
    core_temp = float(match[1])

    if core_temp < 50:
        percentage = 1
    elif core_temp >= 50 and core_temp < 70:
        percentage = 50
    else:
        percentage = 100

    core_temps.append({
        "core_name": core_name,
        "core_temp": core_temp,
        "percentage": percentage
    })

json_data = {
    "text": f"{package_temp}°C" if package_temp else None,
    "alt": None,
    "tooltip": "\n".join([f"{core['core_name']}: {core['core_temp']}°C" for core in core_temps]),
    "class": "custom-temp",
    "percentage": max(core['percentage'] for core in core_temps) if core_temps else 0
}

print(json.dumps(json_data))
