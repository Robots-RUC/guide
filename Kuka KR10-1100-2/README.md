# KUKA KR10-1100-2 - Documentation & Code

This repository contains documentation and code to work with the Kuka KR10-1100-2 at the Roskilde University.
The repository is still being developed, please submit pull-requests or reach out by mail.

# Safety

> [!CAUTION]
> This robot is dangerous! 
>
> Read the following text.

The KUKA KR10-1100-2 is an industrial robot, it is made for high payloads and speeds **but not safety**. It has no functionality or sensors to stop when a person is near. Therefore, do not enter the safety region while it is operating. 

## Rules 

1. Never stand in the range of the robot while it is operating.
2. Do not lean under the robot arm, even when off.
3. Only run in automatic or external mode if you got a safety introduction from a teacher and the OK from them. 
4. Always test your programs in T1 mode before running in automatic mode.
5. Before approaching the robot, for example to change the toolhead, make sure the robot is not moving and the e-stop on the control board is pressed in. 

# Usage
There are three ways to control the robot: 
1. Creating a program as a file, uploading it on the robot controller and running it. Best for long running, static programs.
2. Using mxAutomation for soft real time control through a connected computer or PLC. This can be used to run programs directly from Grasshopper, p5js, etc.
3. Robot Sensor Interface, hard real time control and external motion planning. Currently not implemented.

## Static Program Files
Static programs can either be created on the robot or generated through programs on another computer and then uploaded to the robot with a USB-stick. 

### Grasshopper 
In Grasshopper the [PRC](https://robotsinarchitecture.com/kuka-prc/) and the [Robots](https://www.food4rhino.com/en/app/robots) plugin can be used to generate KRL code. 

> [!CAUTION]
> Always run the programs in T1 mode before running int Automatic mode.

## mxAutomation

mxAutomation allows controlling the Robot in soft real-time through a connected computer or PLC.

### Parametric Robot Control Server

The Grasshopper library PRC by [Robots in Architecture](https://robotsinarchitecture.com/) implements the communication over the mxAutomation protocol with the robot. This allows us to write simpler code in for example Javascript or even to use plugins in programs such as Grasshoppe and Blender. More information and downloads can be found [here](https://robotsinarchitecture.com/kuka-prc/).

#### Setup
1. Connect the ```XF4``` ethernet cable to the computer.
3. Run the ```XF4_ethernet.bat``` file. (xxx-todo)
4. Run the ```Launch PRC``` prgram. 

#### Grasshopper

1. Open the example Grasshopper file (xxx-todo)
2. Save the file with a new name. Do not make changes to the example file. 
3. The PRC software should launch automatically. Make sure the robot IP is set to the correct one, double check the robots IP through the smartPAD.
4. The Grasshopper PRC component should say that it established a connection. 
> [!CAUTION]
> The next steps will make the robot move. Stand clear of it and have the emergency stop button ready.
5. Toggle ```Move enable``` to ```true```, if it was ```true``` before, toggle to ```false``` and then ```true```
2. Everytime the command input of the component changes the robot will execute the moves. 

### Robot Sensor Interface
Currently not implemented or explored. Could be a nice semester project!

---

> [!CAUTION]
> The following is only to change the robots settings. For normal usage this should not be necessary.



### Requirements
- [iiqWorks.Cockpit](https://my.kuka.com/s/category/robotics-software/engineering-for-robot-systems/kuka-iiqworks/kuka-iiqworkscockpit/0ZG1i000000XacAGAS?language=en_US&tab=Products) 

- [iiqWorks.Sim](https://my.kuka.com/s/category/robotics-software/engineering-for-robot-systems/kuka-iiqworks/kuka-iiqworkssim/0ZG1i000000XaTjGAK?language=en_US)

The Kuka software is Windows only but it works with some tweaks on macOS via Parallels.

Ethernet connection to ```XF1``` port on the robot control box.
On the computer the ethernet connection must be set to ```Automatic IP assignment```. The robot acts as a DHCP server. 

### Adding the Robot

1. Start Cockpit
2. Click add controller -> enter IP of robot (On the tech pedant go to system settings, it shows the robot IP) 
3. Authenticate with login ```expert``` and password.

### Changing an Instance

> [!CAUTION]
> Do not change the existing instances. Always duplicate an existing one and change the new one. 

1. Stop all instances
2. Click on one of the instances
3. Duplicate instance
4. Open instance in ```Sim``` or start ```Sim``` -> ```Open``` -> ```Online```->```Download the new instance```

### Notes on creating a new instance
If you get errors with a new instance, double check the Fieldbus entries in Sim. 
There should be: 

KUKA System Bus(Sys-x48)->Kuka Digital IO Board (DIOB)->KUKA Extended IO Board (EIOB)

and

KUKA Controller Bus (KCB)->KUKA Servo Pack (KSP-320-8)->Resolver Digital Converter (RDC) -> EM8905-1001 I/O-Module + Electronic Mastering Device

Also double check the EtherCAT addresses with an old version.

### mxAutomation
Protocol: ```Established```

Device ```UDP```

Click ```Use default I/O mapping```


Remote IP: the IP of the computer (172.16.0.5)

Port: leave as is (1336)

Timeout: 1000

Enable KRMsgNet: False



### PRC
1. Download the installation file from the [website](https://portal.robotsinarchitecture.org/download) and follow the installation instructions. 
2. Connect the computer via ethernet to the ```XF4``` port of the robot.
3. Set the computers IP to static IP with ```172.16.0.5``` and Subnet mask of ```255.255.255.0```