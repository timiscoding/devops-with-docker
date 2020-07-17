#!/bin/bash
GIT_URL=$1
REPO_NAME=$(echo "$GIT_URL" | awk -F '/' '{print $NF}')
IMAGE_NAME="$DOCKER_LOGIN/$REPO_NAME"

echo "# Image builder"
echo "## 1/3. Cloning repo $REPO_NAME"
git clone "$GIT_URL"
cd "$REPO_NAME"

echo
echo "## 2/3. Building image $IMAGE_NAME"
docker build -t "$IMAGE_NAME" .

echo
echo "## 3/3. Push image to docker hub"
docker login -u "$DOCKER_LOGIN" -p "$DOCKER_PASSWORD"
docker push "$IMAGE_NAME"
