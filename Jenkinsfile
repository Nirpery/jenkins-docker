pipeline {
    agent any

    environment {
        COMPOSE_PROJECT_NAME = "jenkins-docker"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Nirpery/jenkins-docker.git'
            }
        }
        stage('Deploy Docker Compose') {
            steps {
                script {
                    // Pull latest images
                    sh 'docker-compose pull'

                    // Bring up containers
                    sh 'docker-compose up -d --remove-orphans'

                    // Optional: prune old unused images
                    sh 'docker image prune -f'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Flight successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}

