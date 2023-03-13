* Scripts for installing pycsep in a Docker container that can be used for pyCSEP training.

These file are used to create a Docker image from the pycsep.
*Files:

** Dockerfile - instructions for creating the Docker image. This uses a recent Ubuntu operating system as the
base file and installs gcc tools, gfortran, fftw libraries, and python3 packages required by the pyCSEP
** build.py - this invokes the docker build. The command it uses to build the image pulls the userID and groupID from it
current environment so that these are not hardcoded into build image script. The userid name is hardcoded to csepuser.
** run_pycsep.py - this starts the toolkit, and mounts the required directory for exchanging files between the toolkit
and the users environment.
** clean.sh - this invokes a docker cleanup script which removes all the local images and containers and frees up space
on the users computer.

*Usage:
A Docker container created from this pycsep requires that a subdirectory, called "target" exists where the docker
pycsep is invoked. This ./target subdirectory will be mounted in the image, and output results will be written
there, so they are exchanged with the docker image.

* command to run notebook inside container is:
Host machine: docker run -it -p 8888:8888 image:version
Inside the Container : jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
Host machine access this url : localhost:8888/tree‌​ 
https://stackoverflow.com/questions/38830610/access-jupyter-notebook-running-on-docker-container
