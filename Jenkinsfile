pipeline{
	agent any

	triggers {
        	githubPush()
    	}

	environment{
		DOCKER_IMAGE = 'technova-inventory'
		DOCKER_TAG = 'latest'
		CONTAINER_NAME = 'technova-container'
	}
	
	stages{
	
		
		stage('Cleanup old container') {
			steps {
                		script {
                    			// Stop and remove any existing container with the same name
                    			sh '''
                        		if [ \$(docker ps -q -f name=$CONTAINER_NAME) ]; then
                            		docker stop $CONTAINER_NAME
                            		docker rm $CONTAINER_NAME
                        		fi
                    			'''
                		}
            		}
        	}

		stage('Build Docker Image'){
			steps {
				script{
					// Build the Docker image
					sh 'docker build -t $DOCKER_IMAGE:$DOCKER_TAG .'
				}
			}
		}

		stage('Run Docker Image') {
			steps {
				script{
				// Run docker container
				sh 'docker run -d -p 8081:80 $DOCKER_IMAGE:$DOCKER_TAG'
				}
			}
		}

	}
}

		
