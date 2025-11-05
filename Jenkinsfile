pipeline {
    agent any

    environment {
        JAVA_HOME = "C:\\Program Files\\Java\\jdk-17"
        PATH = "${env.JAVA_HOME}\\bin;${env.PATH}"
    }

    stages {
        stage('Check Java') {
            steps {
                bat 'java -version'
            }
        }

        stage('Check JMeter') {
            steps {
                bat '"C:\\Users\\sreek\\OneDrive\\Desktop\\Softwares\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3\\bin\\jmeter.bat" -v'
            }
        }
    }
}
