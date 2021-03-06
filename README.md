# Bug fixed PeriodicExecutionContext (for OpenRTM-aist-1.1.2)

The default execution context has a bug that causes RTC to hang when rewinding the system clock.
This PeriodicExecutionContext2 is the bugfix version of the execution context.
This EC is an independent and loadable module version of the EC, so you can avoid EC bugs without recompiling your RTC.

# How to Download

Please download zip package from the following Github repository's "Download ZIP" button.
- https://github.com/n-ando/PeriodicExecutionContext

![zipdownload](https://user-images.githubusercontent.com/11814060/81547113-59e91580-93b6-11ea-88b0-5f95543d9542.png)


# How to compile

You can compile the "PeridicExecutionContext2.so" shared object as follows.

```
$ unzip PeriodicExecutionContext2-master.zip
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

Please add the following lines to the rtc.conf.

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
