pipeline {
    agent any

    environment {
        COMPOSE_PROJECT_NAME = "jenkins-docker"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Nirpery/jenkins-docker.git'
            }
        }
        stage('Deploy Docker Compose For Nir and Nave Pery!!!!!!!!!!') {
            steps {
                script {
                    // לעבוד בתוך workspace של ה־repo
                    dir("${env.WORKSPACE}") {
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
    }

    post {
        success {
            echo 'Deployment Flight successful And containers are Up!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
