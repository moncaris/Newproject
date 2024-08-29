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

        stage('Test Docker Image') {
            steps {
                script {
                    // Run the Docker container for testing
                    docker.image("${IMAGE_NAME}").run('-d -p 8085:80 --name temp-container')
                    
                    // Perform basic health check
                    sh 'curl -s http://localhost:8085 | grep "Welcome to Our Landing Page!"'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Remove the temporary container
                    sh 'docker rm -f temp-container'
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

