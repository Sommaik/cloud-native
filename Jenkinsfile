pipeline {
    // agent {
    //     docker { image 'python:3.9-slim' }
    // }
    agent any
    environment {
        PYTHON_VERSION = '3.9'
        VENV_NAME = 'venv'
        PROJECT_NAME = 'dataops-foundation'
        DB_SERVER = 'mssql'
        DB_NAME = 'test_db'
        DB_USERNAME = 'sa'
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

        stage('Build docker image') {
            agent {
                docker { 
                    image 'docker:dind' 
                }
            }
            steps {
                sh 'docker version'
            }
        }
    }
}