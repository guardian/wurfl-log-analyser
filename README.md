Analysis of guardian.co.uk apache logs for mobile device operating system name and versions.

Install
-------

Download the http://wurfl.sourceforge.net/ database (Eg, wurfl-2.3.1.xml.gz) to ./wurfl/

```
bundle
rspec -f d spec
```

Should generate :-

    Log
        Tokenize a httpd log entry
  
    Wurfl
        Extract a phones details from a user agent string
        Cache a user agent to speed up to repeat lookups

Usage
-----

Grep your access log (or you could process the whole thing) :-

``` 
grep Android logs/guardian-access_log.20120622.guweb01 > logs/guardian-access_log.20120622.guweb0.android
```

Process it :-

```
ruby filter.rb < logs/guardian-access_log.20120622.guweb0.android > androids
```

Run a simple report :-

```
cut -f 1-3,5-12 androids | uniq | sort | cut -f 2,5,6-12 | sort | uniq -c
```

Which should generate a table with _count, status code, os version, os, brand, model, browser and browser version_ as column headings :- 

    ...
    3   302     3.2 Android HTC       Flyer        Android Webkit
    26  302     3.2 Android Motorola  MZ604        Android Webkit
    1   302     3.2 Android Samsung   GT-P7100     Android Webkit
    3   302     3.2 Android Samsung   GT-P7300     Android Webkit
    2   302     3.2 Android ZTE       V71A         Android Webkit
    21  302     4.0 Android Acer      A510         Android Webkit
    22  302     4.0 Android Acer      A511         Android Webkit
    26  302     4.0 Android Asus      Eee PadTF201 Android Webkit
    110 302     4.0 Android Google    Nexus S      Android Webkit
    10  302     4.0 Android HTC       Desire Z     Android Webkit
    208 302     4.0 Android HTC       Sensation    Android Webkit
    8   302     4.0 Android HTC       SensationXE  Android Webkit
    924 302     4.0 Android Samsung   GT-I9100     Android Webkit
    ...
