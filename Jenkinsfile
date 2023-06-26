pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/MlPADI/reactgokul.git'
            }
        }
        stage('Docker Login') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhubcredentials', passwordVariable: 'dockerpass', usernameVariable: 'dockeruser')]) {
                    bat "docker login -u ${dockeruser} -p ${dockerpass}"
                        echo 'docker login done' // some block
                    }
                }
            }
        }
        
        stage('Docker build') {
            steps {
                bat 'docker build -f ./Dockerfile -t gokulreact:v3 .'
                echo 'Image created'
            }
        }
        
        stage('docker build images') {
            steps {
                bat 'docker images'
            }
        }
        
        
        stage('Docker config') {
            steps{
                bat 'docker tag gokulreact:v3 padidaparama/gokulreact:v3'
                echo 'Docker image taged'
            }     
        }
        stage('Docker hub') {
            steps {
                bat 'docker push padidaparama/gokulreact:v3' 
            }
        }    
    }
}
