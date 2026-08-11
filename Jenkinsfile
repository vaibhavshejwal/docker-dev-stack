pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Code already checked out by Jenkins via SCM'
            }
        }
        stage('Build') {
            steps {
                sh 'ls -la'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t docker-dev-stack:latest .'
            }
        }
    }
}
