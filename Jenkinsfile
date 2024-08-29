pipeline {
    agent any

    environment {
        IMAGE_NAME = 'landing-page'
        REPO_URL = 'https://github.com/moncaris/Newproject.git'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from Git
                git url: "${REPO_URL}", branch: 'master' 
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Remove any existing container with the same name
                    sh 'docker rm -f temp-container || true'
                }
            }
        }
    }

    post {
        always {
            // Clean workspace after the build
            cleanWs()
        }
    }
}

