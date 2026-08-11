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
                sh 'docker --version || echo "docker not found"'
            }
        }
    }
}
