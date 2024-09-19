pipeline {
    agent any

    tools {
        jdk 'JDK_8'  // Jenkins에 설정된 JDK 이름
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh './gradlew clean build'
            }
        }

        stage('Test') {
            steps {
                sh './gradlew test'
            }
            post {
                always {
                    junit '**/build/test-results/test/*.xml'
                }
            }
        }

        stage('Docker Build') {
            steps {
                script {
                    docker.build("your-docker-image:${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Docker Push') {
            steps {
                script {
                    docker.withRegistry('https://your-docker-registry', 'docker-credentials-id') {
                        docker.image("your-docker-image:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'kubernetes-credentials-id', serverUrl: 'https://172.30.1.65:6443']) {
                        sh "kubectl set image deployment/your-deployment your-container=your-docker-image:${env.BUILD_NUMBER}"
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}