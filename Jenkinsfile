pipeline {
    agent any

    environment {
        COMPOSE_PROJECT_NAME = "jenkins-demo"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Nirpery/jenkins-demo.git'
            }
        }
[O
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

