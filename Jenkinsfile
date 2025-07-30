pipeline {
    agent any
    environment {
        APP_NAME = "test app name"
        IMAGE_NAME = "<registry-server>/hello"
    }
    stages {
        stage("Build Image") {
            steps {
                sh "echo ${APP_NAME}"
                sh "docker version"
                sh "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage("Delivery") {
            steps {
                withCredentials(
                [usernamePassword(
                    credentialsId: '<credential-id จากขั้นตอนการสร้าง credential id>',
                    passwordVariable: 'gitlabPassword',
                    usernameVariable: 'gitlabUser'
                )])
                {
                    sh "docker login registry.gitlab.com -u ${gitlabUser} -p ${gitlabPassword}"
                    sh "docker tag ${IMAGE_NAME} ${IMAGE_NAME}:1.0.${BUILD_NUMBER}"
                    sh "docker push ${IMAGE_NAME}"
                    sh "docker push ${IMAGE_NAME}:1.0.${BUILD_NUMBER}"
                    sh "docker rmi ${IMAGE_NAME}:1.0.${BUILD_NUMBER}"
                    sh "docker rmi ${IMAGE_NAME}"
                }
            }
        }

        stage("Deploy") {
            steps {
                script {
                    try {
                    sh "kubectl set image deployment/hello -n <name space> hello=${IMAGE_NAME}:1.0.${BUILD_NUMBER}"
                    sh "echo update service"
                    } catch (e){
                    sh "kubectl apply -f k8s/hello-deploy.yml"
                    sh "echo create service"
                    }
                }
            }
        }
    }
}