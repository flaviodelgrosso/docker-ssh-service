set -o allexport
source .env
set +o allexport

if [ -z "$1" ]; then
    echo "WARN: Please provide a container name as first argument."
    exit 1
fi

IMAGE_NAME="ssh-server"
CONTAINER_NAME="ssh-server-$1"

docker build \
    --build-arg SSH_USER="$SSH_USER" \
    --build-arg SSH_PWD="$SSH_PWD" \
    -t $IMAGE_NAME --no-cache .

if [ $? -ne 0 ]; then
    echo "ERROR: Docker build failed."
    exit 1
else
    docker run -it -d -p 22:22 --name $CONTAINER_NAME $IMAGE_NAME
fi
