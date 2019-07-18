#!/usr/bin/env python

import sys,os
import time
from functools import wraps

def timethis(func):
    '''
    Decorator that reports the execution time.
    '''
    @wraps(func)
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(func.__name__, end-start)
        return result
    return wrapper

def ts2str(timeStamp):
    localTime = time.localtime(timeStamp)
    return time.strftime("%Y-%m-%d %H:%M:%S", localTime)


def echo_file(fullpath, interval):
    if os.path.exists(fullpath):
        mtime = os.path.getmtime(fullpath)
        if mtime > interval:
            fsize=os.path.getsize(fullpath)/1024
            print('{}\t{:.2f}K\t{}'.format(ts2str(mtime),fsize,fullpath))


@timethis
def modified_within(root, seconds, ext):
    now = time.time()
    for path, dirs, files in os.walk(root):
        for name in files:
            fullpath = os.path.join(path, name)
            if ext:
                base_name,ext_name=os.path.splitext(name)
                if ext==ext_name[1:]:
                    continue
            echo_file(fullpath, now - seconds)

if __name__ == '__main__':
    if len(sys.argv) < 3:
        print('Usage: {} dir hours [file_ext]'.format(sys.argv[0]))
        raise SystemExit(1)

    ext = None
    if len(sys.argv) == 4:
        ext = sys.argv[3]

    root_dir=sys.argv[1]
    hours=sys.argv[2]
    modified_within(root_dir,float(hours)*60*60, ext)