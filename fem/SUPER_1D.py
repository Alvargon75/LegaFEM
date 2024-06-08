import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

from fem import *

class SUPER_1D(SUPER_ELEMENT):

    # Empty Properties
    K = np.zeros((12,12))
    R = np.zeros((12,12))
    L = 0
    u = np.zeros((6,2))
    DOFs = np.zeros((6,2))
    nodes = np.zeros((2,3))

    def __init__(self) -> None:
        super().__init__()

    def buildRotationMatrix(self):
        node1 = self.nodes[0,:]
        node2 = self.nodes[1,:]
        # print(f"Node 1 = {node1};\nNode 2 = {node2};")
