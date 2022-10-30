## Installation
- install Godot
- install timeflux at https://github.com/timeflux/timeflux
```
pip install requirement.txt
```

### Requirements
- Linux with Python ≥ 3.9
- Godot Engine ≥ 3.5.1

### Launching
- Open Godot, select import and open the file at game/project.godot (you only need to import the game once)
- Make sure that your bitolino is connected to the computer
- type the command in the conda timeflux env: (watch out when detecting eye movement timeflux will simulate keypress such as right and left arrow)
```
timeflux -d neurofeedback/main.yaml
```
- In godot press the up right play button to launch the game
- Enjoy the game