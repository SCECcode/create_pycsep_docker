[![License](https://img.shields.io/badge/License-BSD_3--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)
![GitHub repo size](https://img.shields.io/github/repo-size/sceccode/create_pycsep_docker)

## Create pyCSEP Docker Images

<a href="http://www.scec.org/research"><img src="https://github.com/sceccode/create_pycsep_docker/wiki/images/csep_logo.png"></a>

## Description 

This repository contains scripts for installing pycsep in a Docker container that can be used for pyCSEP training. The resulting Docker images are posted on Dockerhub. When run, they provide access to a pyCSEP installation, and a Jupyter notebook that provides an introduction to pyCSEP.

## Table of Contents
1. [Software Documentation](https://github.com/SCECcode/create_pycsep_docker/wiki)
2. [Installation](#installation)
3. [Usage](#usage)
4. [Contributing](#contributing)
5. [Credits](#credit)
6. [License](#license)

## pyCSEP Installation Options

The file in this repository include the following:

* Dockerfile - instructions for creating the Docker image. This uses a recent Ubuntu operating system as the
base file and installs gcc tools, gfortran, fftw libraries, and python3 packages required by the pyCSEP
* build.py - this invokes the docker build. The command it uses to build the image pulls the userID and groupID from it
current environment so that these are not hardcoded into build image script. The userid name is hardcoded to csepuser.
* test_pycsep_jup.py - this runs a local copy of the pycsep_image and does not try to retrieve the image from dockerhub.
* run_pycsep_jup.py - this runs the pycsep toolkit,  mounts the required directory for exchanging files between the toolkit
and the users environment. This prints a url to the screen where the user can access the pycsep_juypter notebook running in the container. This retrieves the pycsep image from dockerhub if it is note found locally on the users docker environment on their computer.
* clean.sh - this invokes a docker cleanup script which removes all the local images and containers and frees up space
on the users computer.

*Usage:
A Docker container created from this pycsep requires that a subdirectory, called "target" exists where the docker
pycsep is invoked. This ./target subdirectory will be mounted in the image, and output results will be written
there, so they are exchanged with the docker image.

*Command to run notebook inside container is:
The run_pycsep_jup.py script, starts the docker image with commands that will open a ports between the container and the host computer. It starts the Docker container with a command like this: docker run -it -p 8888:8888 image:version

The Dockefile contains instructions to start the jupyter notebook with the following commands, inside the Container : jupyter notebook --ip 0.0.0.0 --no-browser --allow-root

When the docker images starts, it prints a URL in the terminal window. The user then can copy that url and paste it into a browser on their computer, and jupyter notebook, with pycsep installed is available and accessible in their browser. The inputs and results are exchanged between the notebook and the users computer through the a subdirectory called ./target which is directory that is accessible both inside the container, and on the users computer.

## Usage
To run a pyCSEP Docker image, the user should start a docker client on their current system. They should open a terminal window on their system and select a directory where they want to run pyCSEP. Then, they should create a subdirectory called "target". This directory will be used to transfer files from the Docker container to and from the user's computer. Then, users invoke a "docker run ..." command to start the image. If the image is not available on their local system, it will be downloaded from Dockerhub.

$ docker run --rm -it --mount type=bind,source="$(pwd)"/target,destination=/app/target  sceccode/pycsep_jup:latest

More information about running pyCSEP Docker images is available in the wiki section of this repository at [pyCSEP Docker Software Documentation](https://github.com/SCECcode/create_pycsep_docker/wiki)

## Support
Support for pyCSEP docker images is provided by the Southern California Earthquake Center (SCEC) Research Computing Group. This group supports several research software distributions including pyCSEP. Users can report issues and feature requests using pyCSEP's github-based issue tracking link below. Developers will also respond to emails sent to the SCEC software contact listed below.
1. [Create pyCSEP Docker Github Issue Tracker:](https://github.com/SCECcode/create_pycsep_docker/issues)
2. Email Contact: software@scec.usc.edu

## Contributing
We welcome contributions to the pyCSEP software framework. An overview of the process for contributing seismic models or software updates to the pyCSEP Project is provided in the [pyCSEP contribution](CONTRIBUTING.md) guidelines. pyCSEP contributors agree to abide by the code of conduct found in our [Code of Conduct](CODE_OF_CONDUCT.md) guidelines.

## Credits
Development of pyCSEP is a group effort. Developers that have contributed to the pyCSEP docker software are listed in the [CREDITS.md](CREDITS.md) file in this repository.

## License
The pyCSEP software is distributed under the BSD 3-Clause open-source license. Please see the [LICENSE.txt](LICENSE.txt) file for more information.
