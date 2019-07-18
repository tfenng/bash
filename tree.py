#!/usr/bin/env python

import sys
import os                                       

def isHidden(path):
    return True if path.startswith('.') else False

def walk(sPath):
    for sChild in os.listdir(sPath):
        if isHidden(sChild):
            continue
        sChildPath = os.path.join(sPath,sChild)
        if os.path.isdir(sChildPath):
                walk(sChildPath)
        else:
            print(sChildPath)
			
if __name__ == "__main__":
    if len(sys.argv) < 2:
        print('Usage: {} directory'.format(sys.argv[0]))
        sys.exit(1)
    
    walk(sys.argv[1])
