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

        stage('Run Docker Container') {
            steps {
                script {
                    docker.image('nginx:latest').run('-p 80:80')
                }
            }
        }

//         stage('Deploy to Kubernetes') {
//             steps {
//                 script {
//                     withKubeConfig([credentialsId: 'kubernetes-credentials-id', serverUrl: 'https://172.30.1.65:6443']) {
//                         sh "kubectl set image deployment/your-deployment your-container=your-docker-image:${env.BUILD_NUMBER}"
//                     }
//                 }
//             }
//         }
    }

    post {
        always {
            cleanWs()
        }
    }
}