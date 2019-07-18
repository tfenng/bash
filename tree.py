#!/usr/bin/env python

import sys
import os                                       

def isHidden(path):
    return True if path.startswith('.') else False

def filter_ext(filepath, ext):
    if ext:
        base_name,ext_name=os.path.splitext(filepath)
        if ext==ext_name[1:]:
            return True
    return False

def walk(sPath,ext):
    for sChild in os.listdir(sPath):
        if isHidden(sChild):
            continue
        sChildPath = os.path.join(sPath,sChild)
        if os.path.isdir(sChildPath):
                walk(sChildPath,ext)
        else:
            if filter_ext(sChildPath,ext):
                print(sChildPath)
			
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print('Usage: {} directory [ext]'.format(sys.argv[0]))
        sys.exit(1)
    
    root=sys.argv[1]
    ext=None
    if len(sys.argv)>2:
        ext=sys.argv[2]

    walk(root,ext)
