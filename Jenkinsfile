pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-nginx"
        IMAGE_TAG = "1.19"
        CONTAINER_NAME = "nginx-old"
        PORT_MAPPING = "8080:80"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/uma123-hub/jenkins.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh """
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                        docker run -d --name ${CONTAINER_NAME} -p ${PORT_MAPPING} ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }
    }
}
