pipeline {
    agent any

    stages {

        stage('Check Java') {
            steps {
                bat 'java -version'
            }
        }

        stage('Run JMeter Tests') {
            steps {
                bat '"C:\\Users\\sreek\\OneDrive\\Desktop\\Softwares\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3\\bin\\jmeter.bat" -n -t tests/dummy_test.jmx -l results/result.jtl -e -o results/report'
            }
        }
    }
}
