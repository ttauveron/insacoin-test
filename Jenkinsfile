pipeline {
  agent any
  stages {
    stage('first_step') {
      parallel {
        stage('test') {
          steps {
            sh 'hgkdfkfgh'
          }
        }
        stage('pass') {
          steps {
            sh 'hostname'
          }
        }
      }
    }
    stage('print') {
      steps {
        echo 'test'
      }
    }
  }
}