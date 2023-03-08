pipeline {
    environment {
        IMAGEN = "josedom24/myapp"
        USUARIO = 'USER_DOCKERHUB'
    }
    agent any
    stages {
        stage('Clone') {
            steps {
                git branch: "main", url: 'https://github.com/Evanticks/jenkins_docker.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    newApp = docker.build "jenkinsprueba:v1"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image("jenkinsprueba:v1").inside('-u root') {
                           sh 'apache2ctl -v'
                        }
                    }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry( '', USUARIO ) {
                        newApp.push()
                    }
                }
            }
        }
        stage('Clean Up') {
            steps {
                sh "docker rmi jenkinsprueba:v1"
                }
        }
    }
}
