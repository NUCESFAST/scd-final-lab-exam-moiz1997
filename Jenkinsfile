pipeline {
    agent any
    stages {
        stage('i211104 Checkout Source') {
            steps {
                git 'https://github.com/NUCESFAST/scd-final-lab-exam-moiz1997.git'
            }
        }
        stage('i211104 Build Docker Images') {
            steps{
                script {
                    def appNames = ['auth', 'classrooms', 'event-bus', 'post', 'client']
                    def folderNames = ['Auth', 'Classrooms', 'event-bus', 'Post', 'client']

                    for (int i = 0; i < appNames.size(); i++) {
                        stage("Building and Running ${appNames[i]}") {
                            // Build the Docker image
                            withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                                sh "docker build -t $DOCKER_USERNAME/${appNames[i]} ./${folderNames[i]}"
                            }
                        }
                    }
                }
            }
        }
        stage('i211104 Push Docker Images') {
            steps{
                script {
                    def appNames = ['auth', 'classrooms', 'event-bus', 'post', 'client']

                    for (int i = 0; i < appNames.size(); i++) {
                        stage("Pushing ${appNames[i]}") {
                            // Push the Docker image
                            withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                                sh 'docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD'
                                sh "docker push $DOCKER_USERNAME/${appNames[i]}"
                            }
                        }
                    }
                }
            }
        }
    }
}