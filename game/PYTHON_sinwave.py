import math, time
from godot import exposed, export, Node

@exposed
class PythonSinwave(Node):
	# magnitude of the applied translation
	factor = export(int, default=100)
	# initial position of the node
	left_right = 1.0

	def _physics_process(self, delta):
		"""
		Called for each rendering. Main code here.
		"""
#		print(self.left_right)	
		self.left_right = math.sin(time.time())
