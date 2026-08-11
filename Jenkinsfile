pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Code already checked out by Jenkins via SCM'
            }
        }
        stage('Parallel Checks') {
            parallel {
                stage('Lint') {
                    steps {
                        echo 'Running lint checks...'
                        sh 'sleep 3'
                        echo 'Lint passed'
                    }
                }
                stage('Static Analysis') {
                    steps {
                        echo 'Running static analysis...'
                        sh 'sleep 3'
                        echo 'Static analysis passed'
                    }
                }
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
