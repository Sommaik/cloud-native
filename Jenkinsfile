pipeline {
    agent {
        docker { image 'python:3.9-slim' }
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

        stage('Data Quality Checks') {
            steps {
                echo '🔍 Running data quality checks...'
                script {
                    sh '. ${VENV_NAME}/bin/activate'
                    sh 'echo "Checking Python imports..."'
                    sh 'python -c "import pandas; import sqlalchemy; import pymssql; print(\'All required packages imported successfully\')"'
                    sh 'echo "Validating ETL pipeline syntax..."'
                    sh 'python -m py_compile etl_pipeline.py'
                    sh 'echo "Running static code analysis..."'
                    sh 'python -m flake8 etl_pipeline.py --max-line-length=100 --ignore=E501,W503 || echo "Code style warnings detected"'
                }
                echo 'Data quality checks completed'
            }
        }
    }
}