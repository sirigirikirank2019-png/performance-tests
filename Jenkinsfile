pipeline {
    agent any

    environment {
        JMETER_HOME = "/opt/apache-jmeter"
    }

    stages {
        stage('Checkout Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sirigirikirank2019-png/performance-tests.git'
            }
        }

        stage('Run JMeter Test') {
            steps {
                sh 'chmod +x run_test.sh'
                sh './run_test.sh'
            }
        }

        stage('Publish HTML Report') {
            steps {
                publishHTML([
                    reportDir: 'results/report',
                    reportFiles: 'index.html',
                    reportName: 'JMeter Test Report',
                    alwaysLinkToLastBuild: true,
                    keepAll: true
                ])
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'results/**', allowEmptyArchive: true
        }
    }
}
