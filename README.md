# Docker SSH Server

This project contains a Dockerfile and a build script to create and run an SSH server container based on Ubuntu. It allows you to easily set up an SSH server inside a Docker container.

## Getting Started

To get started, follow the steps below:

1. Clone this repository to your local machine.
2. Rename the `.env.example` file to `.env` and update the values of `SSH_USER` and `SSH_PWD` with your desired SSH username and password.
3. Open a terminal and navigate to the project directory.

### Building the Docker Image

To build the Docker image, run the `build.sh` script with the container name as first argument:

```bash
./build.sh <CONTAINER_NAME>
```

The script will read the values from the `.env` file and build the Docker image with the provided SSH username and password.

### Running the Container

After the Docker image is built, you can run the container using the following command:

```bash
docker run -it -d -p 22:22 --name <CONTAINER_NAME> <IMAGE_NAME>
```

Replace `<CONTAINER_NAME>` with the desired name for your container and `<IMAGE_NAME>` with the name of the Docker image.

### Connecting to the SSH Server

To connect to the SSH server running inside the container, you can use an SSH client such as OpenSSH. Use the following command:

```bash
ssh -p 22 <SSH_USER>@<CONTAINER_IP>
```

Replace `<SSH_USER>` with the SSH username you set in the `.env` file, and `<CONTAINER_IP>` with the IP address of the running container. You can obtain the IP address by running `docker inspect <CONTAINER_NAME>`.
