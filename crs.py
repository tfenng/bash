from osgeo import osr, gdal
import sys
import pyproj

def printnn(line):
    print("\r\n{}".format(line))

def show_crs(fname):
    print(fname)
    ds = gdal.Open(fname)
    old_cs= osr.SpatialReference()
    proj_str = ds.GetProjectionRef()
    old_cs.ImportFromWkt(proj_str)
    printnn(old_cs)
    cs = pyproj.CRS.from_string(proj_str)
    printnn("EPSG:{}".format(cs.to_epsg()))

if __name__ =="__main__":
    fname='/home/tony/changed/h28/83.tif'
    if len(sys.argv)>1:
        fname = sys.argv[1]
    show_crs(fname)