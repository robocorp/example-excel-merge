# example-excel-merge
Example demonstrates the use of pandas to merge Excel sheets

## Background

An imaginary police patrol has setup a speed trap in two consecutive days. They have recorded all license plates and speeds to Excel sheets - one sheet per day. 

*Day 1*
````
License plate  Speed
ABC-123           81
DEF-456           80
CBA-321           80
FED-654           81
...
````

*Day 2*
````
License plate  Speed
ABC-123           81
DEF-456           81
AAA-111           80
BBB-222           81
...
````

Because police is understanding, they will send tickets only for those, who have been speeding in both days.

The task is to collect all license plates that have exceeded the speed limit in both days:

*Example result*
```
License plate  Speed_x  Speed_y
ABC-123             81       81
```

## Solution

High level process is implemented in *tasks.robot* with Robot Framework. The heavy lifting in data processing is done with python library *Pandas*. To use Pandas in Robot Framework, a helper library *PandasUtils.py* is implemented.

Task stores the resulting Excel file to *output* directory and is uploaded to Robocorp Cloud as artifact. The resulting data is also stored in *Work Item* as list of dicts:

````
tickets = [
    {"License plate": "ABC-123", "Speed_x": 81, "Speed_y": 81},
    {"License plate": "DEF-456", "Speed_x": 81, "Speed_y": 81},
]
````

That data can be used in later steps of the process e.g. with *Slack Notifier* robot.

    MESSAGE = "\n".join(["%s %s %s" % (d["License plate"], d["Speed_x"], d["Speed_y"]) for d in tickets])

