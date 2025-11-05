pipeline {
    agent any

    environment {
        JAVA_HOME = "C:\\Program Files\\Java\\jdk-17"
        JMETER_HOME = "C:\\Users\\sreek\\OneDrive\\Desktop\\Softwares\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3"
        PATH = "${env.JAVA_HOME}\\bin;${env.JMETER_HOME}\\bin;C:\\Windows\\System32;${env.PATH}"
    }

    stages {
        ::stage('Check Java') {
            steps {
                bat 'java -version'
            }
        }

        ::stage('Check JMeter') {
            steps {
                bat '"C:\\Users\\sreek\\OneDrive\\Desktop\\Softwares\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3\\bin\\jmeter.bat" -v'
            }
        }

        stage('Clean old results') {
            steps {
                bat '''
                if exist output (
                    echo Deleting old output folder...
                    rmdir /s /q output
                    mkdir output
                ) else (
                    echo No previous output folder found.
                    mkdir output
                )
                '''
            }
        }
    }
}
