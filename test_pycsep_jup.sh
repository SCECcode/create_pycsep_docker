# -rm removes container on exit
# -it indicates inteactive + --tty so that users are at an interactive tty command line when the container starts
docker run -p 8888:8888 --rm -it --mount type=bind,source="$(pwd)"/target,destination=/home/csepuser/target pycsep_jup:latest
