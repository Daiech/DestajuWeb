#!/bin/bash
uwsgi --socket :10000 --wsgi-file wsgi.py -d logfile-destajuweb.log


