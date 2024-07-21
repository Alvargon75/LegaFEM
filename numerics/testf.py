# This is a Python file named whatever you like. It demonstrates
#   automatic `fmodpy` wrapping.

import fmodpy
import numpy as np

f_rotation = fmodpy.fimport("./f_rotation.f90", dependencies=["./f_aux.f90"])

v1 = np.array([1,2,3], dtype=float, order="F")
v2 = np.array([4,5,6], dtype=float, order="F")

nodes = np.array([
    [0,0,0],
    [1,0,0],
    [1,1,0],
    [0,1,0]
], dtype=float, order="F")


# print(f_rotation.rotmat1d(nodes))
print(f_rotation.f_rotation.cross(v1,v2))
