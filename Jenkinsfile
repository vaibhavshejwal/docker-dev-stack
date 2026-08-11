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
                        sh 'sleep 3'
                        echo 'Lint passed'
                    }
                }
                stage('Static Analysis') {
                    steps {
                        sh 'sleep 3'
                        echo 'Static analysis passed'
                    }
                }
            }
        }
        stage('Flaky Test') {
    steps {
        retry(3) {
            script {
                def result = sh(script: '''#!/bin/bash
                    echo $((RANDOM % 2))
                ''', returnStdout: true).trim()
                if (result == '0') {
                    echo 'Test passed this time'
                } else {
                    error 'Test failed randomly — simulating flaky test!'
                }
            }
        }
    }
}
        stage('Docker Build') {
            steps {
                sh 'docker build -t docker-dev-stack:latest .'
            }
        }
        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: '9d7b487d-368b-4c82-a6e0-8ad0214baf84', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker tag docker-dev-stack:latest $DOCKER_USER/docker-dev-stack:latest
                        docker push $DOCKER_USER/docker-dev-stack:latest
                    '''
                }
            }
        }
    }
}
