pipeline {
    agent {
        docker { image 'python:slim' }
    }
    environment {
        PYTHON_VERSION = '3.9'
        VENV_NAME = 'venv'
        PROJECT_NAME = 'dataops-foundation'
        DB_SERVER = '35.185.131.47'
        DB_NAME = 'TestDB'
        DB_USERNAME = 'SA'
        LOG_LEVEL = 'INFO'
    }
    stages {
        stage('Setup Python Environment') {
            steps {
                echo 'Setting up Python virtual environment for DataOps...'
                sh 'pwd'
                sh 'python3 -m venv ${VENV_NAME}'
                sh '. ${VENV_NAME}/bin/activate'
                sh 'pip install --upgrade pip --timeout=120'
                sh 'pip install -r requirements.txt --timeout=300'
                echo 'Python environment setup completed'
            }
        }
    }
}