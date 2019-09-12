#!/usr/bin/python3
import pyinotify
import sys

if __name__ =="__main__":
	dname='/tmp'
	if len(sys.argv)>1:
		dname = sys.argv[1]
	wm = pyinotify.WatchManager()
	notifier = pyinotify.Notifier(wm)
	wm.add_watch(dname, pyinotify.ALL_EVENTS)
	notifier.loop()