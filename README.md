Analysis of guardian.co.uk apache logs for mobile device operating system name and versions.

Install
-------

Download the http://wurfl.sourceforge.net/ database (Eg, wurfl-2.3.1.xml.gz) to ./wurfl/

```
bundle
rspec
```

Usage
-----

Grep your access log (or you could process the whole thing) :-

``` 
grep iPhone logs/guardian-access_log.20120622.guweb01 > logs/guardian-access_log.20120622.guweb0.iphone
```

Process it :-

```
ruby filter.rb < logs/guardian-access_log.20120622.guweb0.iphone > iphones
```

Run a simple report :-

```
cut -f 1,2,3,5,6,7 iphones | uniq | sort | cut -f 2,5,6 | sort | uniq -c
```

Which should generate a table with _count, status code, os version, os_ as column headings :- 

    1   302     4.1     RIM OS
    3   302     4.2     RIM OS
    1   302     4.2.2   RIM OS
    10  302     4.3     RIM OS
    3   302     4.5     RIM OS
    36  302     4.6     RIM OS
    86  302     4.6.1   RIM OS
    1   302     4.7     RIM OS
    4   302     4.7.1   RIM OS
    645 302     5.0     RIM OS
    994 302     6.0     RIM OS
    557 302     7.0     RIM OS
    100 302     UNKNOWN UNKNOWN

