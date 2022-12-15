pipeline {
    agent any
    tools {
        maven 'MAVEN-3.8.4'
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/vyoubi/hc-cloud-gateway']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image') {
            steps {
                sh 'docker version'
                sh 'docker build -t valere1991/hc-service-registry .'
                sh 'docker image list'
            }
        }
        stage('Docker Hub login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub-Val', passwordVariable: 'password', usernameVariable: 'username')]) {
                sh 'docker login -u $username -p $password'
                }
            }
        }
        stage('Push image to Docker Hub') {
            steps {
                sh 'docker push valere1991/hc-service-registry'
            }
        }
        stage("remove unused docker image") {
            steps {
            sh 'docker rmi hc-service-registry -f'
            sh 'docker rmi valere1991/hc-service-registry -f'
         }
        }
//         stage('Deploy to k8s') {
//             steps {
//                 sh 'kubectl apply -f deploymentservice.yaml'
//             }
//         }
//     }
}
