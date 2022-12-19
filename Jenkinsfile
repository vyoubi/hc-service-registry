pipeline {
    agent any
    tools {
        maven 'MAVEN-3.8.4'
    }
    environment {
        DOCKER_TAG = "${BUILD_NUMBER}"
    }
    stages {
        stage('Build Maven') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/vyoubi/hc-service-registry']]])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image') {
            steps {
                sh 'docker version'
                sh 'docker build -t hc-service-registry .'
                sh 'docker image list'
                sh 'docker tag hc-service-registry valere1991/hc-service-registry:${DOCKER_TAG}'
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
                sh 'docker push valere1991/hc-service-registry:${DOCKER_TAG}'
            }
        }
        stage("remove unused docker image") {
            steps {
            sh 'docker rmi hc-service-registry -f'
            sh 'docker rmi valere1991/hc-service-registry:${DOCKER_TAG} -f'
         }
        }
//         stage('Deploy to k8s') {
//             steps {
//                 sh 'kubectl apply -f deploymentservice.yaml'
//             }
//         }
     }
}
