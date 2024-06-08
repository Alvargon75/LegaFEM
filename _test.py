import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

import fem

import numerics.f_rotation as f_rotation


print(fem)
neu = fem.SUPER_1D()
neu.buildRotationMatrix()
print(neu.K[2,2])

x = f_rotation.cross([1,2,3], [4,5,6])
print(x)
