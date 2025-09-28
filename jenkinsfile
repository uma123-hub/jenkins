pipeline {
    agent { label 'slave-node-agent' }

    environment {
        IMAGE_NAME = "my-nginx"
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
                    dockerImage = docker.build("${IMAGE_NAME}:1.19")
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh """
                docker stop nginx-old || true
                docker rm nginx-old || true
                docker run -d --name nginx-old -p 8080:80 ${IMAGE_NAME}:1.19
                """
            }
        }
    }
}
