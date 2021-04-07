from jnpr.junos import Device
from pprint import pprint
import json

devices = [
        "dallas-fw0",
        "austin-fw0",
        "houston-fw0"
    ]


def write_to_file(device, payload):
    # Open function to open the file "hostname.py" 
    # (same directory) in append mode 
    filename = f"./output/{device}.py"
    file1 = open(filename,"a")
    file1.write(str(payload) + "\n")
    file1.close()
    pass


for device in devices:
    with Device(host=device, user='automation', password='juniper123') as dev:
        try:
            show_version = dev.rpc.get_software_information({'format':'json'})
            write_to_file(device, show_version)
        except:
            pass
