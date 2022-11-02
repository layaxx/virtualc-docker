# Dockerized Virtual-C IDE

This project enables you to run the Virtual-C IDE on almost every Linux distribution.

## Requirements

- [Docker](https://docs.docker.com/) installed
- Your user is added to the docker group (Check with the command `groups $USER`. If the output doesn't include *docker* follow the instructions at [https://docs.docker.com](https://docs.docker.com/install/linux/linux-postinstall/))
- xhost installed

## How to run the Virtual-C IDE

1. Clone or download this repository.
2. Open a new terminal and navigate with `cd /Path/To/Repository` into the downloaded repository.
3. Run `./virtualc.sh` (if not executable, run `chmod +x ./virtualc.sh` beforehand). The first time running the script will take a moment, because the docker image *virtualc:2.3* is created initially.
4. \[Optional\] To add a launcher to your application menu, create a *virtualc.desktop* file in ~/.local/share/applications with the following content:
```
[Desktop Entry]
Encoding=UTF-8
Name=Virtual-C IDE
Comment=A programming environment for learning and teaching the C language
Exec=/Path/To/virtualc.sh
Icon=/Path/To/virtualc.png
Terminal=false
Type=Application
Categories=Application;Education;Development;IDE
StartupNotify=true
```

## Credits

This project uses the [Virtual-C IDE](https://sites.google.com/site/virtualcide/).