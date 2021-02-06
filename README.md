# example-excel-merge
Example demonstrates the use of pandas to merge Excel sheets

An imaginary police patrol has setup a speed trap in two consecutive days. They have recorded all license plates and speeds to Excel sheets - one sheet per day. Because police is understanding, they will send tickets only for those, who have been speeding in both days.

The task is to collect all license plates that have exceeded the speed limit in both days:

Example content

```
Day 1

License plate  Speed
ABC-123           81
DEF-456           80
CBA-321           80
FED-654           81
...

Day 2
License plate  Speed
ABC-123           81
DEF-456           81
AAA-111           80
BBB-222           81
...

RESULT
License plate  Speed_x  Speed_y
ABC-123             81       81
```

