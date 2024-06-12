import numpy as np
import fmodpy

# import fem
import os

os.add_dll_directory("E:\Code\LegaFEM\codef")
fr = fmodpy.fimport('./numerics/codef.f03')

print(fr.__doc__)