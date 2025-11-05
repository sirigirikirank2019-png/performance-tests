pipeline {
    agent any

    environment {
        // Path to your Java JDK
        JAVA_HOME = 'C:\\Program Files\\Java\\jdk-17'
        // Path to JMeter
        JMETER_HOME = 'C:\\Users\\sreek\\OneDrive\\Desktop\\Softwares\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3'
        // Prepend Java and JMeter to PATH
        PATH = "${env.JAVA_HOME}\\bin;${env.JMETER_HOME}\\bin;${env.PATH}"
    }

    stages {
        stage('Check Java') {
            steps {
                bat '''
                echo ===== Java Check =====
                java -version
                echo JAVA_HOME=%JAVA_HOME%
                '''
            }
        }

        stage('Prepare Results Folder') {
            steps {
                bat '''
                echo ===== Preparing Results Folder =====
                if not exist results mkdir results
                '''
            }
        }

        stage('Run JMeter Test') {
            steps {
                bat '''
                echo ===== Running JMeter =====
                cd "%WORKSPACE%"
                jmeter.bat -n -t tests/SimplePipelineTest.jmx -l results/simpleresult.jtl
                '''
            }
        }

        stage('Post-Build') {
            steps {
                echo '=== JMeter Test Completed ==='
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}
