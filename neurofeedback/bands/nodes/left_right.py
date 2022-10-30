from enum import Enum
import pyautogui
from timeflux.nodes.window import TimeWindow

class State(Enum):
    STATE_NOTHING = 0
    STATE_LEFT = 1
    STATE_RIGHT = 2

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
        self.fpz_max : float = 0 
        self.fpz_min : float = 0
        self.state : State = State.STATE_NOTHING
        self.last_state : State = State.STATE_NOTHING
        self.one_out_of_two : int = 0
        self.length = 100

    def update(self):
        if self.i.ready() and self._data:
            
            # self.logger.debug("\n%s\n" % self.i.data.Fpz.values)
            self.fpz_max = max(self.i.data.Fpz.values)
            self.fpz_min = min(self.i.data.Fpz.values)
            if (self.fpz_min < -35):
                # self.logger.debug(f'fpz_min {self.fpz_min}')
                self.state = State.STATE_RIGHT
            if (self.fpz_max > 35):
                # self.logger.debug(f'fpz_max {self.fpz_max}')
                self.state = State.STATE_LEFT
            if (self.last_state != self.state and self.state != State.STATE_NOTHING):
                if (self.one_out_of_two % 2):
                    key_to_press = ""
                    if (self.state == State.STATE_LEFT):
                        key_to_press = "left"
                    if (self.state == State.STATE_RIGHT):
                        key_to_press = "right"
                    pyautogui.keyDown(key_to_press)
                    pyautogui.keyUp(key_to_press)
                    self.logger.debug(f'state {self.state} {self.fpz_min} {self.fpz_max}')
                self.one_out_of_two += 1
            # self.logger.debug(f'state {self.state} {self.fpz_min} {self.fpz_max}')
            self.fpz_max = 0
            self.fpz_min = 0
            self.last_state = self.state
            self.state = State.STATE_NOTHING
