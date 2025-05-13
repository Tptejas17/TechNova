pipeline{
	agent any
	environment{
		DOCKER_IMAGE = 'technova-inventory'
		DOCKER_TAG = 'latest'
		
	}
	
	stages{
		stage('Checkout'){
			steps {
				//Checkout the code from GitHub
				git 'https://github.com/Tptejas17/TechNova.git'
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

		
