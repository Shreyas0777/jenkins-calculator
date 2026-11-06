pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building calculator application'
                sh 'python3 --version'
            }
        }

        stage('Test') {
            steps {
                sh 'python3 -m pytest -v --junitxml=test-results.xml'
            }
            post {
                always {
                    junit 'test-results.xml'
                }
            }
        }

        stage('Package') {
            steps {
                sh 'tar -czf calculator-package.tar.gz calculator.py test_calculator.py requirements.txt'
                archiveArtifacts artifacts: 'calculator-package.tar.gz', fingerprint: true
            }
        }

        stage('Approval') {
            steps {
                input message: 'Approve deployment to staging?', ok: 'Deploy'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    mkdir -p /tmp/usn-staging
                    cp calculator-package.tar.gz /tmp/usn-staging/
                    echo "Deployment completed successfully"
                '''
            }
        }
    }
}
