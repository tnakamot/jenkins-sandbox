pipeline {

//    agent any

    agent {
        docker { image 'ubuntu:22.04' }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'date > build.log'
                sh 'zip for_download.zip build.log'
                archiveArtifacts artifacts: 'for_download.zip'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                
                // Note: this test randomly fails               
                sh '[ $RANDOM -lt 16384 ]'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
    post {
        failure {
            mail to: 'tnakamoto@tmt.org', subject: 'Pipeline failed', body: "Something is wrong with ${env.BUILD_URL}"
        }
    }
}
