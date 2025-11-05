# Performance Tests Pipeline
This repository contains Apache JMeter test plans and a Jenkins pipeline to automate performance testing. It is designed to run tests in a CI/CD environment while keeping test results organized and separate from source code.
---
## Folder Structure
performance-tests-pipeline/
├── tests/ # JMeter test plans (.jmx)
├── results/ # Test results and reports (ignored in Git)
├── Jenkinsfile # Jenkins pipeline configuration
├── .gitignore # Git ignore rules
└── README.md # Project documentation


**Notes:**
- `results/` folder is generated at runtime and should not be tracked by Git.
- `.gitignore` ensures that temporary files like `.jtl` results and HTML reports are not committed.
---
## Prerequisites
- **Java:** JDK 17 or higher installed  
- **Apache JMeter:** Version 5.6.3 installed  
- **Jenkins:** Configured and running  
- **Git:** For cloning the repository  
Ensure environment variables are set:
```bash
JAVA_HOME=C:\Program Files\Java\jdk-17
JMETER_HOME=C:\Path\to\apache-jmeter-5.6.3

Add Java and JMeter binaries to your PATH if needed:
set PATH=%JAVA_HOME%\bin;%JMETER_HOME%\bin;%PATH%

Running Tests Locally
Navigate to the project folder:
cd performance-tests-pipeline
Ensure the results/ folder exists or create it:
mkdir results
Run JMeter in non-GUI mode:
jmeter.bat -n -t tests/SimplePipelineTest.jmx -l results/simpleresult.jtl -e -o results/report
Tips:
Delete or rename previous .jtl files to avoid “Results file is not empty” errors.
Use unique or timestamped result folders for CI/CD pipelines.
Running Tests via Jenkins Pipeline
Create a Jenkins job pointing to this repository.
Use a pipeline script (Jenkinsfile) with steps like:
pipeline {
    agent any
    environment {
        JAVA_HOME = "C:\\Program Files\\Java\\jdk-17"
        JMETER_HOME = "C:\\Path\\to\\apache-jmeter-5.6.3"
        PATH = "${env.JAVA_HOME}\\bin;${env.JMETER_HOME}\\bin;${env.PATH}"
    }
    stages {
        stage('Run JMeter Test') {
            steps {
                bat '''
                if not exist "%WORKSPACE%\\results" mkdir "%WORKSPACE%\\results"
                if exist "%WORKSPACE%\\results\\simpleresult.jtl" del "%WORKSPACE%\\results\\simpleresult.jtl"
                jmeter.bat -n -t tests/SimplePipelineTest.jmx -l "%WORKSPACE%\\results\\simpleresult.jtl" -e -o "%WORKSPACE%\\results\\report"
                '''
            }
        }
        stage('Archive Results') {
            steps {
                archiveArtifacts artifacts: 'results/**', allowEmptyArchive: true
            }
        }
    }
}
Notes:

Timestamped folders can be used to avoid overwriting old results.
Archiving ensures all test results and reports are accessible from Jenkins build pages.
