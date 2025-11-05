pipeline {
    agent any

    environment {
        JAVA_HOME = 'C:\\Program Files\\Java\\jdk-17'
        PATH = "${env.JAVA_HOME}\\bin;${env.PATH}"
    }

    stages {
        stage('Check Java') {
            steps {
                bat '''
                echo Checking Java...
                java -version
                echo JAVA_HOME=%JAVA_HOME%
                where java
                '''
            }
        }
    }
}
