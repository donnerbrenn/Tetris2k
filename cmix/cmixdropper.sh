#!/bin/sh
tail -n+3 $0 > t;cmix -d t i;rm t;chmod +x i;./i;rm i;exit
