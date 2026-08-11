pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Code already checked out by Jenkins via SCM'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t docker-dev-stack:latest .'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker rm -f test-container || true'
                sh 'docker run -d --name test-container -p 8081:80 docker-dev-stack:latest'
                sh 'sleep 3'
                sh 'curl -f http://localhost:8081 || (echo "Health check failed" && exit 1)'
            }
        }
        stage('Cleanup') {
            steps {
                sh 'docker rm -f test-container'
            }
        }
    }
}
