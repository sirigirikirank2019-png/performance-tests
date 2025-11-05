pipeline {
    agent any

    environment {
        JMETER_HOME = "C:\\Users\\sreek\\OneDrive\\Desktop\\Softwares\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3"
        PATH = "${env.JMETER_HOME}\\bin;${env.PATH}"
    }

    stages {
        stage('Checkout Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/sirigirikirank2019-png/performance-tests.git'
            }
        }

        stage('Run JMeter Tests') {
            steps {
                echo '=== Running JMeter Test ==='
                bat '"C:\\Users\\sreek\\OneDrive\\Desktop\\Softwares\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3\\bin\\jmeter.bat" -n -t tests/dummy_test.jmx -l results/result.jtl -e -o results/report'
                echo '=== JMeter Test Completed ==='
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
