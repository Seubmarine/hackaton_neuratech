from timeflux.nodes.window import TimeWindow
import numpy as np
import pandas as pd

class LeftRight(TimeWindow):
    """ DE LA DOC

    Attributes:
        i (Port): Default input, expects DataFrame.
        o (Port): Default output, provides DataFrame and meta.

    Args:
        length (float): Window length
        step (float): Step length
        average (mean|median) : Average method

    """

    def __init__(self, meta=False, data=True):
        self._meta = meta
        self._data = data


    def update(self):
        if self.i.ready() and self._data:
            self.logger.debug("\n AAAAAAAA %s" % self.i.data.Fpz.values)
            list=[]
            for i in range(49) :
                if self.i.data.Fpz.values[i] > 0:
                    list.append(1)
                else :
                    list.append(0)
            print(list)
