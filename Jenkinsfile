pipeline {
    agent any

    triggers {
        githubPush()
    }

    environment {
        DOCKER_IMAGE = 'technova-inventory'
        DOCKER_TAG = 'latest'
        CONTAINER_NAME = 'technova-container'
        PORT = '8081'
    }

    stages {

        stage('Cleanup old container') {
            steps {
                script {
                    sh '''
                    echo "Checking for container named $CONTAINER_NAME..."
                    # Stop and remove container by name
                    if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
                        echo "Stopping and removing existing container named $CONTAINER_NAME"
                        docker stop $CONTAINER_NAME || true
                        docker rm $CONTAINER_NAME || true
                    fi

                    echo "Checking for containers using port $PORT..."
                    # Find container using port and stop/remove it
                    USED_CONTAINER=$(docker ps -aq --filter "publish=$PORT")
                    if [ "$USED_CONTAINER" ]; then
                        echo "Port $PORT is in use by container ID: $USED_CONTAINER. Stopping and removing it..."
                        docker stop $USED_CONTAINER || true
                        docker rm $USED_CONTAINER || true
                    fi
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    sh 'docker run -d --name $CONTAINER_NAME -p $PORT:80 $DOCKER_IMAGE:$DOCKER_TAG'
                }
            }
        }

    }
}

      
	
