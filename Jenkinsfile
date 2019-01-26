pipeline {
    
    agent { dockerfile true }
    
    stages {
	stage("Clean workspace and checkout source") {
	    steps {
		deleteDir()
		checkout scm
	    }
	}
	
	stage('Build insacoin') {
	    steps {
		checkout scm
		sh './autogen.sh'
		sh './configure LDFLAGS=-L`ls -d /opt/db*`/lib/ CPPFLAGS=-I`ls -d /opt/db*`/include/'
		sh 'make'
		// stash includes '**'
      }
    }
    stage('test') {
      steps {
		sh 'make check' // || true
		// junit '**/target/*.xml'
      }
    }
  }
}
