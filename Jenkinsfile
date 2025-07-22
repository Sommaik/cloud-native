pipeline {
    agent {
        label 'python-agent'
    }
    environment {
        VENV_NAME = 'venv'
        IMAGE_NAME = 'ghcr.io/sommaik/etl'
    }
    stages {
        // stage('Setup Python Environment') {
        //     steps {
        //         echo 'Setting up Python virtual environment for DataOps...'
        //         sh 'pwd'
        //         sh 'python3 -m venv ${VENV_NAME}'
        //         sh '. ${VENV_NAME}/bin/activate'
        //         sh 'pip install --upgrade pip --timeout=120'
        //         sh 'pip install -r requirements.txt --timeout=300'
        //         echo 'Python environment setup completed'
        //     }
        // }

        // stage('Data Quality Checks') {
        //     steps {
        //         echo 'Running data quality checks...'
        //             sh '. ${VENV_NAME}/bin/activate'
        //             sh 'echo "Checking Python imports..."'
        //             sh 'python -c "import pandas; import sqlalchemy; import pymssql; print(\'All required packages imported successfully\')"'
        //             sh 'echo "Validating ETL pipeline syntax..."'
        //             sh 'python -m py_compile etl_pipeline.py'
        //             sh 'echo "Running static code analysis..."'
        //             sh 'python -m flake8 etl_pipeline.py --max-line-length=100 --ignore=E501,W503 || echo "Code style warnings detected"'
        //         echo 'Data quality checks completed'
        //     }
        // }

        // stage('Unit Tests') {
        //     steps {
        //         echo 'Running DataOps ETL unit tests...'
        //             sh '. ${VENV_NAME}/bin/activate'
        //             sh 'echo "Running ETL pipeline unit tests..."'
        //             sh 'python -m unittest test_etl_pipeline.py -v'   
        //             sh 'echo "Running pytest with coverage..."'   
        //             sh 'python -m pytest test_etl_pipeline.py -v --tb=short || echo "Some tests may have warnings"'   
        //         echo 'Unit tests completed'
        //     }
        // }
        // stage('ETL Pipeline Validation') {
        //     steps {
        //         echo 'Validating ETL pipeline configuration...'
        //         sh '. ${VENV_NAME}/bin/activate'
        //         sh 'python validate_pipeline.py'
        //     }
        // }

        stage('SonarQube Analysis') {
            agent any
             steps {
                script {
                    def scannerHome = tool 'sonarqube';
                    withSonarQubeEnv(installationName: 'sonarqube') {
                        sh "${scannerHome}/bin/sonar-scanner"
                    }
                }
            }
        }

        // stage('Build docker image') {
        //     agent any
        //     steps {
        //         sh 'docker version'
        //         sh "docker build -t ${IMAGE_NAME} ."
        //         sh "docker tag ${IMAGE_NAME} ${IMAGE_NAME}:1.0.${BUILD_NUMBER}"
        //     }
        // }
        // stage("Package") {
        //     agent any
        //     steps {
        //         withCredentials(
        //         [usernamePassword(
        //             credentialsId: 'github-id',
        //             passwordVariable: 'gitPassword',
        //             usernameVariable: 'gitUser'
        //         )]
        //     ){
        //         sh "docker login -u ${env.gitUser} -p ${env.gitPassword} ghcr.io"
        //         sh "docker push ${env.IMAGE_NAME}:1.0.${env.BUILD_NUMBER}"
        //         sh "docker push ${env.IMAGE_NAME}"
        //         sh "docker rmi ${env.IMAGE_NAME}:1.0.${env.BUILD_NUMBER}"
        //         sh "docker rmi ${env.IMAGE_NAME}"
        //     }
        //     }
        // }
    }
}