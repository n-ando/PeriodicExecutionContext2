# Bug fixed PeriodicExecutionContext ( for OpenRTM-aist-1.1.2)

The default execution context has a bug that causes RTC to hang when rewinding the system clock.
This PeriodicExecutionContext2 is the bugfix version of the execution context.
This EC is an independent and loadable module version of the EC, so you can avoid EC bugs without recompiling your RTC.

# How to compile

You can compile the "PeridicExecutionContext2.so" shared object as follows.

```
$ unzip PeriodicExecutionContext2.zip
$ cd PeriodicExecutionContext2
$ make
```

Here, you can find PeridicExecutionContext2.so

# How to attache this EC to your RTC

## Copy the "PeriodicExecutionContext2.so" to the RTC's dir

```
$ cp PeriodicExecutionContext2.so <path to the RTC>
```

## Edit the "rtc.conf" for the RTC

Please add the following lines.

```config:rtc.conf
manager.modules.load_path: ./
manager.modules.preload: PeriodicExecutionContext2.so
exec_cxt.periodic.type: PeriodicExecutionContext2
```

## Run your RTC

After adding the configuration for new EC, you just run your RTC as follows.

```
$ ./YourRTCComp
```
